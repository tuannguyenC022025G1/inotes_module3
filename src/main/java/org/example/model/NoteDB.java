package org.example.model;

import org.example.service.DatabaseConnection;

import java.sql.*;
import java.sql.Timestamp;

public class NoteDB implements Note {
    private int id;
    private String title;
    private String content;
    private int typeId;
    private Timestamp createdAt;

    public NoteDB() {}

    public NoteDB(int id, String title, String content, int typeId, Timestamp createdAt) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.typeId = typeId;
        this.createdAt = createdAt;
    }

    @Override
    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    @Override
    public String getTitle() {
        return title;
    }

    @Override
    public String getContent() {
        return content;
    }

    @Override
    public String getType() {
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT name FROM note_type WHERE id = ?")) {
            stmt.setInt(1, typeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean save() {
        String sql = "INSERT INTO note (title, content, type_id, created_at) VALUES (?, ?, ?, ?)\n";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, typeId);
            stmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) id = rs.getInt(1);
                return true;
            }
            return false;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(int id) {
        String sql = "UPDATE note SET title = ?, content = ?, type_id = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, typeId);
            stmt.setInt(4, id);
            int rows = stmt.executeUpdate();
            this.id = id;
            return rows > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete() {
        if (id == 0) return false;
        String sql = "DELETE FROM note WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public int getId() {
        return id;
    }

    @Override
    public Timestamp getCreatedAt() {
        return createdAt;
    }
}