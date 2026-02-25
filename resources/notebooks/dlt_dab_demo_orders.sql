-- Databricks notebook source
CREATE OR REFRESH STREAMING TABLE IF NOT EXISTS st_orders
AS
SELECT * FROM STREAM(samples.tpch.orders)

-- COMMAND ----------

CREATE OR REPLACE MATERIALIZED VIEW IF NOT EXISTS mv_orders
AS
SELECT COUNT(o_orderkey),o_orderstatus
FROM LIVE.st_orders
GROUP BY o_orderstatus
