package ru.javawebinar.topjava.repository;

import ru.javawebinar.topjava.model.MealTo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MealToRepository extends CrudRepository<MealTo, Long> {
}