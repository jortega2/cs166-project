COPY USR (
	userId,
	password,
	email,
    name,
    dateofbirth
    )
FROM '../../data/usr.csv'
WITH DELIMITER ',';

COPY CONNECTION_USR (
	userId,
	connectionId,
	status,
    )
FROM '../../data/Connection.csv'
WITH DELIMITER ',';

COPY EDUCATIONAL_DETAILS (
	userId,
	instituitionName,
	major,
    degree,
    startDate,
    enddate
    )
FROM '../../data/Edu_det.csv'
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
FROM '../../data/Message.csv'
WITH DELIMITER ',';

COPY WORK_EXPR (
	userId,
	company,
	role,
    location,
    startDate,
    enddate
    )
FROM '../../data/work_ex.csv'
WITH DELIMITER ',';