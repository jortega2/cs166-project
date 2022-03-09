COPY USR (
        userId,
        password,
        email,
    name,
    dateofbirth
    )
FROM 'usr.txt'
WITH DELIMITER ',';

COPY CONNECTION_USR (
        userId,
        connectionId,
        status
    )
FROM 'connection.txt'
WITH DELIMITER ',';

COPY EDUCATIONAL_DETAILS (
        userId,
        instituitionName,
        major,
    degree,
    startDate,
    enddate
    )
FROM 'edu_det.txt'
WITH DELIMITER ',';

COPY MESSAGE (
        msgId,
        senderId,
        receiverId,
    contents,
    sendTime,
    deleteStatus,
    status
    )
FROM 'message.txt'
WITH DELIMITER ',' CSV HEADER;

COPY WORK_EXPR (
        userId,
        company,
        role,
    location,
    startDate,
    enddate
    )
FROM 'work_ex.txt'
WITH DELIMITER ',';

