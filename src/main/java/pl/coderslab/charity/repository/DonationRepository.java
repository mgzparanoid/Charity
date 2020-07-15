package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entity.Donation;

@Repository
public interface DonationRepository extends JpaRepository <Donation, Long> {

    //Czy to jest poprawne query do tego wyświetlenia? Co robi nativeQuery, bo to z baeldunga, pisało że ustawia NATYWNOść zapytania
    @Query(nativeQuery = true, value = "SELECT SUM(quantity) FROM donation;")
    Long sumOfBags();

}
