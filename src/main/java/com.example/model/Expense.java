package com.example.model;

import lombok.*;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
@Builder
public class Expense {
    private int id;
    private String title;
    private double amount;
    private String notes;
    private Date expenseDate;
}