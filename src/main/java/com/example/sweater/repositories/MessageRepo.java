package com.example.sweater.repositories;

import com.example.sweater.entities.Message;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {
    List<Message> findByTag(String tag);

    @EntityGraph(attributePaths = {"author"})
    Iterable<Message> findAll();
}
