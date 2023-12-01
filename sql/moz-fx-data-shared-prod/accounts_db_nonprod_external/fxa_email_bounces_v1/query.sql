SELECT
  email,
  bounceType,
  bounceSubType,
  SAFE.TIMESTAMP_MILLIS(SAFE_CAST(createdAt AS INT)) AS createdAt,
  emailTypeId,
  diagnosticCode,
FROM
  EXTERNAL_QUERY(
    "moz-fx-fxa-nonprod.us.fxa-rds-nonprod-stage-fxa",
    """SELECT
         email,
         bounceType,
         bounceSubType,
         createdAt,
         emailTypeId,
         diagnosticCode
       FROM
         fxa.emailBounces
    """
  )