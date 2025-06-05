package org.example.model;

import java.sql.Timestamp;

public interface Note {
    void setTitle(String title);
    void setContent(String content);
    void setTypeId(int typeId);
    String getTitle();
    String getContent();
    String getType();
    boolean save();
    boolean update(int id);
    boolean delete();
    int getId();
    Timestamp getCreatedAt();
}