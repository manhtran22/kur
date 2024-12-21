package com.example.mahnbao.controllers;

import com.example.mahnbao.models.Reservation;
import com.example.mahnbao.models.User;
import com.example.mahnbao.services.ReservationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ReservationController {
    private final ReservationService reservationService;

    @GetMapping("/")
    public String reservations(@RequestParam(name = "subject", required = false) String subject, Principal principal, Model model) {
        model.addAttribute("reservations", reservationService.listReservations(subject));
        model.addAttribute("user", reservationService.getUserByPrincipal(principal));
        return "reservations";
    }

    @GetMapping("/reservation/{id}")
    public String reservationInfo(@PathVariable Long id, Model model) {
        model.addAttribute("reservation", reservationService.getReservationById(id));

        return "reservation-info";
    }

    @PostMapping("/reservation/create")
    public String createReservation(@ModelAttribute Reservation reservation, Principal principal) {
        User user = reservationService.getUserByPrincipal(principal);
        if (user.isGuest()) {
            reservation.setTableId(0);
            reservation.setPriority("Средний");
            reservation.setState("Новый");
            reservation.setGuest(user);
        }
        reservationService.saveReservation(principal, reservation);
        return "redirect:/my/reservations";
    }

    @PostMapping("/reservation/delete/{id}")
    public String deleteReservation(@PathVariable Long id) {
        reservationService.deleteReservation(id);
        return "redirect:/";
    }

    @GetMapping("/my/reservations")
    public String userReservations(Principal principal, Model model) {
        User user = reservationService.getUserByPrincipal(principal); // Получаем пользователя по principal
        model.addAttribute("user", user);
        model.addAttribute("reservations", user.getReservations());
        return "my-reservations";
    }

    @GetMapping("/my/reservations/{id}")
    public String userReservation(@PathVariable Long id, Model model) {
        User user = reservationService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("reservations", user.getReservations());
        return "my-reservations";
    }
}
