

package com.library.service;

import com.library.repository.BookRepository;
import org.springframework.stereotype.Service;
import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    // Setter method for dependency injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void manageBooks() {
        System.out.println("Managing books...");
        bookRepository.save();
    }
}

