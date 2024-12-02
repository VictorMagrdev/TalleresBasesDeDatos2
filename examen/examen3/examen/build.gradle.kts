plugins {
    id("java")
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
    implementation("org.mongodb:mongodb-driver-sync:5.2.1")
    implementation("org.slf4j:slf4j-api:2.0.16")
    testImplementation("ch.qos.logback:logback-classic:1.5.12")
    testImplementation("org.slf4j:slf4j-simple:2.0.16" )
    testImplementation("ch.qos.logback:logback-classic:1.5.12")
    implementation("org.neo4j.driver:neo4j-java-driver:5.27.0")
}

tasks.test {
    useJUnitPlatform()
}