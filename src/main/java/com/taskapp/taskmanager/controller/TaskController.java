package com.taskapp.taskmanager.controller;

import com.taskapp.taskmanager.model.Task;
import com.taskapp.taskmanager.repository.TaskRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Comparator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TaskController {

    private final TaskRepository taskRepo;

    public TaskController(TaskRepository taskRepo) {
        this.taskRepo = taskRepo;
    }

@GetMapping("/")
public String home(Model model) {
    List<Task> tasks = taskRepo.findAll();
    // Sort by dueDate ascending
    tasks.sort(Comparator.comparing(Task::getDueDate));
    model.addAttribute("tasks", tasks);
    model.addAttribute("newTask", new Task());
    return "index";
}


    @PostMapping("/add")
    public String addTask(@RequestParam String description,
                      @RequestParam String dueDate,
                      @RequestParam String priority) {
    Task task = new Task();
    task.setDescription(description);
    task.setDueDate(LocalDate.parse(dueDate)); // Converts string to LocalDate
    task.setPriority(priority);
    taskRepo.save(task);
    return "redirect:/";
}


    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id) {
        taskRepo.deleteById(id);
        return "redirect:/";
    }
}
