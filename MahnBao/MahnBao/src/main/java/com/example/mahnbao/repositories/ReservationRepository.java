package com.example.mahnbao.repositories;

import com.example.mahnbao.models.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> findBySubject(String subject);
}
