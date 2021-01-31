#include <iostream>
#include <gtest/gtest.h>

TEST(AssertFalseTest, Subtest_2) {
	ASSERT_FALSE(0 == 0);
}


TEST(AssertTrueTest, Subtest_1) {
	ASSERT_TRUE("25" == "twentyfive");
}

int main (int argc, char* argv[]) {
	testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}
