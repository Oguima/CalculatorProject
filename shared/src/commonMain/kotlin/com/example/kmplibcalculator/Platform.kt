package com.example.kmplibcalculator

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform