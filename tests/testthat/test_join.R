context("JOINs")

test_that("JOIN", {
  expect_equal(
    LEFT_JOIN('left_tbl', 'right_tbl', 'id'),
    "LEFT JOIN right_tbl USING (id)")

  expect_error(
    JOIN('left', right_tbls = c('r1', 'r2'), on = list('a', 'b', 'c'))
  )

  expect_equal(
    RIGHT_JOIN('left_tbl', 'right_tbl', 'id', prefer_using = FALSE),
    "RIGHT JOIN right_tbl ON left_tbl.id=right_tbl.id")

  expect_equal(
    INNER_JOIN('left_tbl', 'right_tbl', c('leftID' = 'rightID')),
    "INNER JOIN right_tbl ON left_tbl.leftID=right_tbl.rightID")

  expect_equal(
    OUTER_JOIN('left_tbl', 'right_tbl', c('lid1' = 'rid1', 'id2')),
    "OUTER JOIN right_tbl ON (left_tbl.lid1=right_tbl.rid1 AND left_tbl.id2=right_tbl.id2)")

  expect_equal(
    LEFT_JOIN('lt', c('rt' = 'right_tbl'), 'id'),
    "LEFT JOIN right_tbl rt USING (id)")

  expect_equal(
    LEFT_JOIN('lt', 'right_tbl', 'id'),
    "LEFT JOIN right_tbl USING (id)")

  expect_equal(
    LEFT_JOIN('lt', 'right_tbl', c('id1', 'id2')),
    "LEFT JOIN right_tbl USING (id1, id2)")

  expect_equal(
    LEFT_JOIN('lt', c('right_tbl1', 'right_tbl2'), list('id1', 'id2')),
    "LEFT JOIN (right_tbl1, right_tbl2) ON (lt.id1=right_tbl1.id1 AND lt.id2=right_tbl2.id2)")

  expect_equal(
    LEFT_JOIN('lt', c('rt1' = 'right_tbl1', 'rt2' = 'right_tbl2'), list('id1', 'id2')),
    "LEFT JOIN (right_tbl1 rt1, right_tbl2 rt2) ON (lt.id1=rt1.id1 AND lt.id2=rt2.id2)")

  expect_equal(
    LEFT_JOIN('lt', c('right_tbl1', 'right_tbl2'), list('id')),
    "LEFT JOIN (right_tbl1, right_tbl2) USING (id)")

  expect_equal(
    LEFT_JOIN('lt', c('right_tbl1', 'right_tbl2'), list(c('id1', 'id2'))),
    "LEFT JOIN (right_tbl1, right_tbl2) USING (id1, id2)")

  expect_equal(
    LEFT_JOIN('lt', c('rt1' = 'right_tbl1', 'rt2' = 'right_tbl2'), c('id1', 'id2')),
    "LEFT JOIN (right_tbl1 rt1, right_tbl2 rt2) USING (id1, id2)")

  expect_equal(
    LEFT_JOIN('lt', c('rt1' = 'right_tbl1', 'rt2' = 'right_tbl2'), c('col.1', 'col.2')),
    "LEFT JOIN (right_tbl1 rt1, right_tbl2 rt2) USING (`col.1`, `col.2`)")
})
