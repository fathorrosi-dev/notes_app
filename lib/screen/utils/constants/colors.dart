import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Text Colors
  static const Color lightTextPrimary = Color(
    0xFFFFFAFA,
  ); // Warna teks utama untuk tema terang
  static const Color darkTextPrimary = Color(
    0xFF0C0F14,
  ); // Warna teks utama untuk tema gelap
  static const Color lightTextSecondary = Color(
    0xFFB0B0B0,
  ); // Teks sekunder untuk tema terang
  static const Color darkTextSecondary = Color(
    0xFF707070,
  ); // Teks sekunder untuk tema gelap

  // Primary Colors
  static const Color primary = Colors.amber; // Warna utama
  static const Color primaryDark = Color(
    0xFF94BA45,
  ); // Variasi gelap dari warna utama
  static const Color primaryLight = Color(
    0xFFD6F589,
  ); // Variasi terang dari warna utama

  // Accent Colors
  static const Color accent = Color(
    0xFF4CAF50,
  ); // Warna aksen untuk tombol atau elemen interaktif
  static const Color accentDark = Color(0xFF388E3C); // Aksen gelap
  static const Color accentLight = Color(0xFFC8E6C9); // Aksen terang

  // Status Colors (Success, Warning, Error)
  static const Color success = Color(0xFF4CAF50); // Warna untuk status sukses
  static const Color warning = Color(
    0xFFFFC107,
  ); // Warna untuk status peringatan
  static const Color error = Color(0xFFF44336); // Warna untuk status error

  // Background Colors
  static const Color dark = Color(0xFF171717); // Warna latar belakang gelap
  static const Color darkSecondary = Color(
    0xFF1D1E20,
  ); // Warna latar belakang sekunder untuk tema gelap
  static const Color light = Color(0xFFF5F4F0); // Warna latar belakang terang
  static const Color lightSecondary = Color(
    0xFFFFFFFF,
  ); // Warna latar belakang sekunder untuk tema terang

  // Border Colors
  static const Color borderLight = Color(
    0xFFE0E0E0,
  ); // Warna border untuk tema terang
  static const Color borderDark = Color(
    0xFF303030,
  ); // Warna border untuk tema gelap

  // Shadow Colors
  static const Color lightShadow = Color(
    0x1A000000,
  ); // Bayangan untuk elemen pada tema terang
  static const Color darkShadow = Color(
    0x66000000,
  ); // Bayangan untuk elemen pada tema gelap

  // Disabled Colors
  static const Color disabled = Color(
    0xFF9E9E9E,
  ); // Warna untuk elemen yang dinonaktifkan
  static const Color disabledDark = Color(
    0xFF616161,
  ); // Warna gelap untuk elemen nonaktif
}
