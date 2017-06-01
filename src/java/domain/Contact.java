package domain;

import java.io.Serializable;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Contact implements Serializable {

    private Long id;
    private int version;

    @NotEmpty(message = "{validation.firstname.NotEmpty.message}")
    @Size(min = 3, max = 60, message = "{validation.Size.message}")
    private String firstname;

    @NotEmpty(message = "{validation.lastname.NotEmpty.message}")
    @Size(min = 3, max = 60, message = "{validation.Size.message}")
    private String lastname;

    private DateTime birthDate;

    private String description;

    public Contact() {

    }

    public Contact(Long id, int version, String firstName, String lastName, String description, DateTime birthDate) {
        this.id = id;
        this.version = version;
        this.firstname = firstName;
        this.lastname = lastName;
        this.birthDate = birthDate;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @DateTimeFormat(iso = ISO.DATE)
    public DateTime getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(DateTime birthDate) {
        this.birthDate = birthDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Contact - Id: " + id + ", First name: " + firstname
                + ", Last name: " + lastname
                + ", Description: " + description;
    }

}
