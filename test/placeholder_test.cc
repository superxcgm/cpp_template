#include <gtest/gtest.h>

#include <superxc/placeholder.h>

TEST(PlaceholderTest, ShouldReturn2When1Plus1) {
    EXPECT_EQ(2, add(1, 1));
}
