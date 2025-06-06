package org.example.controller;

import org.example.model.Note;
import org.example.service.NoteService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/notes")
public class NoteServlet extends HttpServlet {
    private NoteService noteService;

    @Override
    public void init() {
        noteService = new NoteService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đảm bảo trả về đúng encoding tiếng Việt
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if ("view".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            List<Note> notes = noteService.searchNotes("");
            Note note = notes.stream().filter(n -> n.getId() == id).findFirst().orElse(null);
            request.setAttribute("note", note);
            request.getRequestDispatcher("viewNote.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("addNote.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            List<Note> notes = noteService.searchNotes("");
            Note note = notes.stream().filter(n -> n.getId() == id).findFirst().orElse(null);
            request.setAttribute("note", note);
            request.getRequestDispatcher("editNote.jsp").forward(request, response);
        } else if ("search".equals(action)) {
            String keyword = request.getParameter("keyword");
            List<Note> notes = noteService.searchNotes(keyword != null ? keyword : "");
            request.setAttribute("notes", notes);
            request.getRequestDispatcher("listNote.jsp").forward(request, response);
        } else {
            List<Note> notes = noteService.searchNotes("");
            request.setAttribute("notes", notes);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cần thiết để xử lý dữ liệu tiếng Việt từ form
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            noteService.addNote(title, content, typeId);
            response.sendRedirect(request.getContextPath() + "/notes");
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            noteService.updateNote(id, title, content, typeId);
            response.sendRedirect(request.getContextPath() + "/notes");
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            noteService.removeNote(id);
            response.sendRedirect(request.getContextPath() + "/notes");
        }
    }
}
