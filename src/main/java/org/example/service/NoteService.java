package org.example.service;

import org.example.model.Note;
import org.example.model.NoteDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteService {
    private Note note;

    public NoteService() {
        note = new NoteDB(); // Luôn sử dụng CSDL
    }

    public List<Note> searchNotes(String keyword) {
        List<Note> result = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT n.*, nt.name FROM note n JOIN note_type nt ON n.type_id = nt.id " +
                             "WHERE n.title LIKE ? OR n.content LIKE ?")) {
            stmt.setString(1, "%" + keyword + "%");
            stmt.setString(2, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                NoteDB note = new NoteDB(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("type_id")
                );
                result.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void addNote(String title, String content, int typeId) {
        NoteDB newNote = new NoteDB();
        newNote.setTitle(title);
        newNote.setContent(content);
        newNote.setTypeId(typeId);
        newNote.save();
    }

    public void updateNote(int id, String title, String content, int typeId) {
        List<Note> notes = searchNotes("");
        Note noteToUpdate = notes.stream().filter(n -> n.getId() == id).findFirst().orElse(null);
        if (noteToUpdate != null) {
            noteToUpdate.setTitle(title);
            noteToUpdate.setContent(content);
            noteToUpdate.setTypeId(typeId);
            noteToUpdate.update(id);
        }
    }

    public void removeNote(int noteId) {
        List<Note> notes = searchNotes("");
        for (Note n : notes) {
            if (n.getId() == noteId) {
                n.delete();
                break;
            }
        }
    }
}