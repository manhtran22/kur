package com.example.mahnbao.services;

import com.example.mahnbao.models.Reservation;
import com.example.mahnbao.models.User;
import com.example.mahnbao.repositories.ReservationRepository;
import com.example.mahnbao.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final UserRepository userRepository;

    public List<Reservation> listReservations(String subject) {
        if (subject != null) return reservationRepository.findBySubject(subject);
        return reservationRepository.findAll();
    }

    public void saveReservation(Principal principal, Reservation reservation) {
        reservation.setUser(getUserByPrincipal(principal));
        log.info("Saving new {}", reservation);
        reservationRepository.save(reservation);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteReservation(Long id) {
        reservationRepository.deleteById(id);
    }

    public Reservation getReservationById(Long id) {
        return reservationRepository.findById(id).orElse(null);
    }

    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }
}
