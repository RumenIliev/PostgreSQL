CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
	searched_balance NUMERIC
)
AS
$$
DECLARE
	holder_info RECORD; -- type is record from the table
BEGIN
	FOR holder_info IN
		SELECT
			ah.first_name || ' ' || ah.last_name AS full_name,
			SUM(a.balance) AS total_balance
		FROM
			account_holders AS ah
		JOIN
			accounts AS a
		ON
			a.account_holder_id = ah.id
		GROUP BY
			full_name
		HAVING
			SUM(a.balance) > searched_balance
		ORDER BY
			full_name
	LOOP
		RAISE NOTICE '% - %', holder_info.full_name, holder_info.total_balance;
	END LOOP;
END;
$$
LANGUAGE plpgsql;


CALL sp_retrieving_holders_with_balance_higher_than(5000000);