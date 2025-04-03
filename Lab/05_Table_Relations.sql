CREATE TABLE mountains(
    id SERIAL PRIMARY KEY,
    name varchar(50)
);
CREATE TABLE peaks(
    id SERIAL PRIMARY KEY,
    name varchar(50),
    mountain_id int,
    CONSTRAINT fk_peaks_mountains FOREIGN KEY (mountain_id)REFERENCES mountains(id)
);



SELECT
    v.driver_id,
    v.vehicle_type,
    concat(c.first_name, ' ', c.last_name) as driver_name
FROM vehicles as v
    join campers as c on c.id = v.driver_id



SELECT
    r.start_point,
    r.end_point,
    r.leader_id,
    concat(c.first_name, ' ', c.last_name) as leader_name
FROM routes as r
    join campers as c ON r.leader_id = c.id



CREATE TABLE mountains(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(50)
);
CREATE TABLE peaks(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(50),
    mountain_id int,
    CONSTRAINT fk_mountain_id
        FOREIGN KEY (mountain_id)
            REFERENCES mountains(id)
                ON DELETE CASCADE
);