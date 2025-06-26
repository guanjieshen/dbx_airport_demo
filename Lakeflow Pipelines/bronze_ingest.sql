CREATE OR REFRESH STREAMING LIVE TABLE gshen_catalog.yvr_airport.baggage_data_test AS
SELECT * FROM STREAM read_files(
  '/Volumes/gshen_catalog/yvr_airport/bag_files',
  format => 'csv',
  header => true,
  mode => 'FAILFAST');