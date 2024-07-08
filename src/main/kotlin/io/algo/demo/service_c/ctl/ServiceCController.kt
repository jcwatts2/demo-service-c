package io.algo.demo.service_c.ctl

import org.springframework.beans.factory.annotation.Value
import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class ServiceCController {

    @Value("\${service.c.message}")
    private lateinit var message: String

    @GetMapping("/c/message")
    fun getMessage() : ResponseEntity<String> {
        return ResponseEntity.ok(message)
    }
}