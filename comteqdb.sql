-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2020 at 05:40 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comteqdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` int(11) NOT NULL,
  `academic_year` char(9) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(1, '2014-2015', '2019-03-15 16:19:01', '2019-03-15 16:19:01', 1),
(2, '2015-2016', '2019-03-15 16:19:16', '2019-03-15 16:19:16', 1),
(3, '2016-2017', '2019-03-15 16:19:19', '2019-03-15 16:19:19', 1),
(4, '2017-2018', '2019-03-15 16:19:28', '2019-03-15 16:19:28', 1),
(5, '2018-2019', '2019-03-15 16:19:31', '2019-03-15 16:19:31', 1),
(6, '2019-2020', '2019-03-15 16:19:35', '2019-03-15 16:19:35', 1),
(7, '2021-2022', '2019-03-22 19:40:07', '2019-03-22 19:40:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `activity`, `time`) VALUES
(3730, 1, 'Attempted to view the list of courses.', '2019-11-11 04:29:00'),
(3731, 2, 'Viewed the list of courses.', '2019-11-11 04:33:50'),
(3732, 1, 'Attempted to create a new course.', '2019-11-11 04:37:13'),
(3733, 2, 'Viewed the list of curriculums.', '2019-11-11 04:55:44'),
(3734, 2, 'Viewed the list of courses.', '2019-11-11 05:26:01'),
(3735, 1, 'Attempted to view the list of academic years.', '2019-11-11 05:51:09'),
(3736, 2, 'Viewed the list of academic years.', '2019-11-11 05:51:16'),
(3737, 2, 'Viewed the list of courses.', '2019-11-11 06:16:20'),
(3738, 2, 'Created a new course.', '2019-11-11 06:17:49'),
(3739, 2, 'Viewed the list of courses.', '2019-11-11 06:18:58'),
(3740, 1, 'Attempted to view the details of Associate in Computer Technology.', '2019-11-11 06:19:20'),
(3741, 2, 'Viewed the details of Associate in Computer Technology.', '2019-11-11 06:19:34'),
(3742, 2, 'Updated the course Associate in Computer Technology.', '2019-11-11 06:20:59'),
(3743, 2, 'Viewed the list of courses.', '2019-11-11 06:21:11'),
(3744, 2, 'Deleted the course Associate in Computer Technology.', '2019-11-11 06:21:39'),
(3745, 2, 'Created a new course.', '2019-11-11 06:22:03'),
(3746, 2, 'Viewed the list of courses.', '2019-11-11 06:22:07'),
(3747, 2, 'Created a new course.', '2019-11-11 06:22:34'),
(3748, 2, 'Created a new course.', '2019-11-11 06:22:48'),
(3749, 2, 'Created a new course.', '2019-11-11 06:23:57'),
(3750, 2, 'Created a new course.', '2019-11-11 06:24:51'),
(3751, 2, 'Created a new course.', '2019-11-11 06:25:24'),
(3752, 2, 'Viewed the list of courses.', '2019-11-11 06:25:29'),
(3753, 2, 'Created a new course.', '2019-11-11 06:26:18'),
(3754, 2, 'Viewed the list of courses.', '2019-11-11 06:26:28'),
(3755, 2, 'Updated the course For deleting.', '2019-11-11 06:26:55'),
(3756, 2, 'Viewed the list of courses.', '2019-11-11 06:26:59'),
(3757, 2, 'Deleted the course For deleting.', '2019-11-11 06:27:11'),
(3758, 2, 'Viewed the list of courses.', '2019-11-11 06:27:13'),
(3759, 2, 'Attempted to view the list of tracks.', '2019-11-11 06:33:21'),
(3760, 2, 'Attempted to view the list of tracks.', '2019-11-11 06:33:27'),
(3761, 2, 'Attempted to view the list of tracks.', '2019-11-11 06:34:31'),
(3762, 2, 'Viewed the list of strands.', '2019-11-11 06:36:20'),
(3763, 2, 'Viewed the list of rooms.', '2019-11-11 06:38:20'),
(3764, 2, 'Viewed the list of rooms.', '2019-11-11 06:46:35'),
(3765, 2, 'Created user account for austin.', '2019-11-11 06:48:24'),
(3766, 2, 'Viewed the list of rooms.', '2019-11-14 11:55:03'),
(3767, 2, 'Created a new room.', '2019-11-14 11:56:02'),
(3768, 2, 'Created a new room.', '2019-11-14 11:58:54'),
(3769, 2, 'Created a new room.', '2019-11-14 11:59:18'),
(3770, 2, 'Created a new room.', '2019-11-14 11:59:35'),
(3771, 2, 'Created a new room.', '2019-11-14 11:59:50'),
(3772, 2, 'Created a new room.', '2019-11-14 11:59:58'),
(3773, 2, 'Viewed the list of rooms.', '2019-11-14 12:00:19'),
(3774, 2, 'Created a new room.', '2019-11-14 12:00:29'),
(3775, 2, 'Created a new room.', '2019-11-14 12:00:42'),
(3776, 2, 'Created a new room.', '2019-11-14 12:00:53'),
(3777, 2, 'Created a new room.', '2019-11-14 12:01:15'),
(3778, 2, 'Created a new room.', '2019-11-14 12:01:26'),
(3779, 2, 'Viewed the list of rooms.', '2019-11-14 12:01:39'),
(3780, 2, 'Updated the room 403.', '2019-11-14 12:02:30'),
(3781, 2, 'Viewed the list of rooms.', '2019-11-14 12:02:34'),
(3782, 2, 'Viewed the list of rooms.', '2019-11-14 12:03:03'),
(3783, 2, 'Created a new room.', '2019-11-14 12:03:14'),
(3784, 2, 'Created a new room.', '2019-11-14 12:04:17'),
(3785, 2, 'Created a new room.', '2019-11-14 12:04:24'),
(3786, 2, 'Viewed the list of rooms.', '2019-11-14 12:04:37'),
(3787, 2, 'Added new instructor record for Marcelino, Noel.', '2019-11-14 12:07:24'),
(3788, 2, 'Added new instructor record for Cuevas, Hasmin.', '2019-11-14 12:08:41'),
(3789, 2, 'Added new instructor record for Corpuz, Glenn.', '2019-11-14 12:09:18'),
(3790, 2, 'Added new instructor record for Santiago, Tracy.', '2019-11-14 12:09:44'),
(3791, 2, 'Added new instructor record for Leong, Richard.', '2019-11-14 12:10:14'),
(3792, 2, 'Added new instructor record for Ramos, Darryl.', '2019-11-14 12:10:41'),
(3793, 2, 'Added new instructor record for Sambili, Evelyn.', '2019-11-14 12:11:20'),
(3794, 2, 'Added new instructor record for Joy, Arvee.', '2019-11-14 12:11:45'),
(3795, 2, 'Added new instructor record for Flores, Michelle.', '2019-11-14 12:12:06'),
(3796, 2, 'Viewed the list of courses.', '2019-11-14 12:12:43'),
(3797, 2, 'Viewed the list of courses.', '2019-11-14 12:13:39'),
(3798, 2, 'Viewed the list of courses.', '2019-11-14 12:23:00'),
(3799, 2, 'Created a new curriculum.', '2019-11-14 12:23:18'),
(3800, 2, 'Created a new curriculum.', '2019-11-14 12:23:43'),
(3801, 2, 'Viewed the list of curriculums.', '2019-11-14 12:24:13'),
(3802, 2, 'Created a new subject.', '2019-11-14 12:25:46'),
(3803, 2, 'Created a new subject.', '2019-11-14 12:26:13'),
(3804, 2, 'Created a new subject.', '2019-11-14 12:26:47'),
(3805, 2, 'Created a new subject.', '2019-11-14 12:27:14'),
(3806, 2, 'Created a new subject.', '2019-11-14 12:28:21'),
(3807, 2, 'Created a new subject.', '2019-11-14 12:28:53'),
(3808, 2, 'Viewed the list of curriculum subjects.', '2019-11-14 12:30:48'),
(3809, 2, 'Viewed the list of curriculums.', '2019-11-14 12:31:07'),
(3810, 2, 'Viewed the list of curriculum subjects.', '2019-11-14 12:31:31'),
(3811, 1, 'Attempted to view the list of subjects.', '2019-11-14 12:34:15'),
(3812, 2, 'Viewed the list of subjects.', '2019-11-14 12:34:24'),
(3813, 2, 'Created a new curriculum subject.', '2019-11-14 12:34:49'),
(3814, 2, 'Created a new curriculum subject.', '2019-11-14 12:34:54'),
(3815, 2, 'Created a new curriculum subject.', '2019-11-14 12:34:58'),
(3816, 2, 'Created a new curriculum subject.', '2019-11-14 12:35:01'),
(3817, 2, 'Created a new curriculum subject.', '2019-11-14 12:35:05'),
(3818, 2, 'Created a new curriculum subject.', '2019-11-14 12:35:08'),
(3819, 2, 'Viewed the list of curriculum subjects.', '2019-11-14 12:35:11'),
(3820, 2, 'Viewed the list of rooms.', '2019-11-14 12:36:18'),
(3821, 2, 'Created a new class schedule.', '2019-11-14 12:38:41'),
(3822, 2, 'Created a new class schedule.', '2019-11-14 12:39:06'),
(3823, 2, 'Created a new class schedule.', '2019-11-14 12:39:23'),
(3824, 1, 'Attempted to view the list of class schedules.', '2019-11-14 12:39:59'),
(3825, 2, 'Viewed the list of class schedules.', '2019-11-14 12:40:03'),
(3826, 2, 'Viewed the list of class schedules.', '2019-11-14 12:40:35'),
(3827, 2, 'Updated the class schedule 7.', '2019-11-14 12:41:33'),
(3828, 2, 'Viewed the list of class schedules.', '2019-11-14 12:41:40'),
(3829, 2, 'Viewed the list of class schedules.', '2019-11-14 12:42:14'),
(3830, 2, 'Viewed the list of class schedules.', '2019-11-14 12:42:14'),
(3831, 2, 'Viewed the list of rooms.', '2019-11-14 12:42:53'),
(3832, 2, 'Updated the room 403.', '2019-11-14 12:43:27'),
(3833, 2, 'Viewed the list of rooms.', '2019-11-14 12:43:46'),
(3834, 2, 'Updated the room 403.', '2019-11-14 12:44:12'),
(3835, 2, 'Created a new class schedule.', '2019-11-14 13:58:36'),
(3836, 2, 'Viewed the list of curriculum subjects.', '2019-11-14 13:59:01'),
(3837, 2, 'Created a new class schedule.', '2019-11-14 13:59:17'),
(3838, 2, 'Created a new class schedule.', '2019-11-14 13:59:33'),
(3839, 2, 'Viewed the list of class schedules.', '2019-11-14 13:59:48'),
(3840, 2, 'Viewed the list of class schedules.', '2019-11-14 13:59:55'),
(3841, 2, 'Viewed the list of class schedules.', '2019-11-14 14:09:57'),
(3842, 2, 'Viewed the list of class schedules.', '2019-11-14 14:14:10'),
(3843, 2, 'Viewed the list of class schedules.', '2019-11-14 14:15:49'),
(3844, 2, 'Viewed the list of class schedules.', '2019-11-14 15:07:35'),
(3845, 2, 'Viewed the list of class schedules.', '2019-11-14 15:10:42'),
(3846, 2, 'Viewed the list of class schedules.', '2019-11-14 15:11:36'),
(3847, 2, 'Viewed the list of class schedules.', '2019-11-14 15:12:59'),
(3848, 2, 'Viewed the list of class schedules.', '2019-11-14 15:42:28'),
(3849, 2, 'Viewed the list of class schedules.', '2019-11-14 16:47:10'),
(3850, 2, 'Viewed the list of class schedules.', '2019-11-14 17:16:38'),
(3851, 2, 'Viewed the list of class schedules.', '2019-11-15 09:08:14'),
(3852, 2, 'Viewed the list of class schedules.', '2019-11-17 16:10:34'),
(3853, 2, 'Viewed the list of subjects.', '2019-11-17 16:14:32'),
(3854, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 16:14:53'),
(3855, 2, 'Created a new subject.', '2019-11-17 16:17:54'),
(3856, 2, 'Created a new subject.', '2019-11-17 16:18:34'),
(3857, 2, 'Created a new subject.', '2019-11-17 16:18:53'),
(3858, 2, 'Created a new subject.', '2019-11-17 16:19:05'),
(3859, 2, 'Created a new subject.', '2019-11-17 16:20:14'),
(3860, 2, 'Created a new subject.', '2019-11-17 16:20:49'),
(3861, 2, 'Created a new subject.', '2019-11-17 16:21:19'),
(3862, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 16:21:30'),
(3863, 2, 'Viewed the list of subjects.', '2019-11-17 16:22:22'),
(3864, 2, 'Viewed the list of subjects.', '2019-11-17 16:24:16'),
(3865, 2, 'Viewed the list of subjects.', '2019-11-17 16:24:26'),
(3866, 2, 'Viewed the list of subjects.', '2019-11-17 16:24:39'),
(3867, 2, 'Viewed the list of subjects.', '2019-11-17 16:24:48'),
(3868, 2, 'Viewed the list of subjects.', '2019-11-17 16:24:55'),
(3869, 2, 'Viewed the list of subjects.', '2019-11-17 16:26:28'),
(3870, 2, 'Viewed the list of subjects.', '2019-11-17 16:26:39'),
(3871, 2, 'Viewed the list of subjects.', '2019-11-17 16:31:36'),
(3872, 1, 'Attempted to view the list of semesters.', '2019-11-17 16:32:29'),
(3873, 2, 'Viewed the list of semesters.', '2019-11-17 16:32:48'),
(3874, 2, 'Created a new curriculum subject.', '2019-11-17 16:33:03'),
(3875, 2, 'Created a new curriculum subject.', '2019-11-17 16:33:07'),
(3876, 2, 'Created a new curriculum subject.', '2019-11-17 16:33:11'),
(3877, 2, 'Created a new curriculum subject.', '2019-11-17 16:33:15'),
(3878, 2, 'Created a new curriculum subject.', '2019-11-17 16:33:19'),
(3879, 2, 'Created a new curriculum subject.', '2019-11-17 16:33:26'),
(3880, 2, 'Created a new curriculum subject.', '2019-11-17 16:33:33'),
(3881, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 16:33:56'),
(3882, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 16:34:09'),
(3883, 2, 'Viewed the list of class schedules.', '2019-11-17 16:45:00'),
(3884, 2, 'Added new time availability for Ramos, Darryl.', '2019-11-17 17:44:52'),
(3885, 2, 'Added new time availability for Ramos, Darryl.', '2019-11-17 17:45:14'),
(3886, 2, 'Added new time availability for Ramos, Darryl.', '2019-11-17 17:45:30'),
(3887, 2, 'Added new time availability for Ramos, Darryl.', '2019-11-17 17:45:38'),
(3888, 2, 'Added new time availability for Ramos, Darryl.', '2019-11-17 17:45:45'),
(3889, 2, 'Added new time availability for Marcelino, Noel.', '2019-11-17 17:46:23'),
(3890, 2, 'Added new time availability for Marcelino, Noel.', '2019-11-17 17:46:32'),
(3891, 2, 'Added new time availability for Marcelino, Noel.', '2019-11-17 17:46:39'),
(3892, 2, 'Added new time availability for Marcelino, Noel.', '2019-11-17 17:47:04'),
(3893, 2, 'Added new time availability for Marcelino, Noel.', '2019-11-17 17:47:18'),
(3894, 2, 'Viewed the list of subjects.', '2019-11-17 17:49:12'),
(3895, 2, 'Added preferred subject for Ramos, Darryl.', '2019-11-17 17:49:42'),
(3896, 2, 'Added preferred subject for Ramos, Darryl.', '2019-11-17 17:49:48'),
(3897, 2, 'Added preferred subject for Marcelino, Noel.', '2019-11-17 17:50:21'),
(3898, 2, 'Added preferred subject for Marcelino, Noel.', '2019-11-17 17:50:25'),
(3899, 2, 'Added preferred subject for Marcelino, Noel.', '2019-11-17 17:50:36'),
(3900, 2, 'Added new time availability for Santiago, Tracy.', '2019-11-17 17:51:36'),
(3901, 2, 'Added new time availability for Santiago, Tracy.', '2019-11-17 17:51:47'),
(3902, 2, 'Added new time availability for Santiago, Tracy.', '2019-11-17 17:51:53'),
(3903, 2, 'Added new time availability for Santiago, Tracy.', '2019-11-17 17:52:00'),
(3904, 2, 'Added new time availability for Santiago, Tracy.', '2019-11-17 17:52:05'),
(3905, 2, 'Added preferred subject for Santiago, Tracy.', '2019-11-17 17:52:35'),
(3906, 2, 'Added preferred subject for Santiago, Tracy.', '2019-11-17 17:52:39'),
(3907, 2, 'Added preferred subject for Marcelino, Noel.', '2019-11-17 17:52:54'),
(3908, 2, 'Added preferred subject for Marcelino, Noel.', '2019-11-17 17:52:59'),
(3909, 2, 'Added preferred subject for Ramos, Darryl.', '2019-11-17 17:54:06'),
(3910, 2, 'Added preferred subject for Ramos, Darryl.', '2019-11-17 17:54:11'),
(3911, 2, 'Added preferred subject for Ramos, Darryl.', '2019-11-17 17:54:16'),
(3912, 2, 'Added preferred subject for Ramos, Darryl.', '2019-11-17 17:54:20'),
(3913, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 17:55:36'),
(3914, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 17:57:31'),
(3915, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 17:57:43'),
(3916, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 17:58:31'),
(3917, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 18:00:11'),
(3918, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 18:00:48'),
(3919, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 18:01:29'),
(3920, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 18:03:26'),
(3921, 2, 'Viewed the list of class schedules.', '2019-11-17 18:04:46'),
(3922, 2, 'Viewed the list of class schedules.', '2019-11-17 18:08:48'),
(3923, 2, 'Viewed the list of class schedules.', '2019-11-17 18:09:24'),
(3924, 2, 'Viewed the list of class schedules.', '2019-11-17 18:10:24'),
(3925, 2, 'Viewed the list of class schedules.', '2019-11-17 18:11:00'),
(3926, 2, 'Viewed the list of class schedules.', '2019-11-17 18:11:42'),
(3927, 2, 'Viewed the list of class schedules.', '2019-11-17 18:12:52'),
(3928, 2, 'Viewed the list of class schedules.', '2019-11-17 18:16:09'),
(3929, 2, 'Viewed the list of class schedules.', '2019-11-17 18:16:28'),
(3930, 2, 'Viewed the list of class schedules.', '2019-11-17 18:17:07'),
(3931, 2, 'Viewed the list of class schedules.', '2019-11-17 18:17:29'),
(3932, 2, 'Viewed the list of class schedules.', '2019-11-17 18:17:55'),
(3933, 2, 'Viewed the list of class schedules.', '2019-11-17 18:18:14'),
(3934, 2, 'Viewed the list of class schedules.', '2019-11-17 18:18:26'),
(3935, 2, 'Viewed the list of class schedules.', '2019-11-17 18:19:45'),
(3936, 2, 'Viewed the list of class schedules.', '2019-11-17 18:20:19'),
(3937, 2, 'Viewed the list of class schedules.', '2019-11-17 18:20:36'),
(3938, 2, 'Viewed the list of class schedules.', '2019-11-17 18:21:21'),
(3939, 2, 'Viewed the list of class schedules.', '2019-11-17 18:22:54'),
(3940, 2, 'Viewed the list of class schedules.', '2019-11-17 18:23:18'),
(3941, 2, 'Viewed the list of class schedules.', '2019-11-17 18:24:10'),
(3942, 2, 'Viewed the list of class schedules.', '2019-11-17 18:24:51'),
(3943, 2, 'Viewed the list of class schedules.', '2019-11-17 18:25:06'),
(3944, 2, 'Viewed the list of class schedules.', '2019-11-17 18:27:07'),
(3945, 2, 'Viewed the list of curriculum subjects.', '2019-11-17 18:28:06'),
(3946, 2, 'Viewed the list of class schedules.', '2019-11-17 18:28:31'),
(3947, 2, 'Viewed the list of class schedules.', '2019-11-17 18:28:42'),
(3948, 2, 'Viewed the list of class schedules.', '2019-11-17 18:29:24'),
(3949, 2, 'Viewed the list of class schedules.', '2019-11-17 18:31:31'),
(3950, 2, 'Viewed the list of class schedules.', '2019-11-17 18:31:52'),
(3951, 2, 'Viewed the list of class schedules.', '2019-11-17 18:35:08'),
(3952, 2, 'Viewed the list of class schedules.', '2019-11-17 18:35:39'),
(3953, 2, 'Viewed the list of class schedules.', '2019-11-17 18:37:35'),
(3954, 2, 'Viewed the list of class schedules.', '2019-11-17 18:37:51'),
(3955, 2, 'Viewed the list of class schedules.', '2019-11-17 18:38:23'),
(3956, 2, 'Viewed the list of class schedules.', '2019-11-17 18:38:35'),
(3957, 2, 'Viewed the list of class schedules.', '2019-11-17 18:39:00'),
(3958, 2, 'Viewed the list of class schedules.', '2019-11-17 18:39:24'),
(3959, 2, 'Viewed the list of class schedules.', '2019-11-17 18:39:35'),
(3960, 2, 'Viewed the list of class schedules.', '2019-11-17 18:44:48'),
(3961, 2, 'Viewed the list of class schedules.', '2019-11-17 18:47:16'),
(3962, 2, 'Viewed the list of class schedules.', '2019-11-17 18:48:42'),
(3963, 2, 'Viewed the list of class schedules.', '2019-11-17 18:55:42'),
(3964, 2, 'Viewed the list of class schedules.', '2019-11-17 18:57:25'),
(3965, 2, 'Viewed the list of class schedules.', '2019-11-17 18:58:32'),
(3966, 2, 'Viewed the list of class schedules.', '2019-11-17 19:00:40'),
(3967, 2, 'Viewed the list of class schedules.', '2019-11-17 19:06:39'),
(3968, 2, 'Viewed the list of class schedules.', '2019-11-17 19:08:40'),
(3969, 2, 'Viewed the list of class schedules.', '2019-11-17 19:08:57'),
(3970, 2, 'Viewed the list of class schedules.', '2019-11-17 19:09:20'),
(3971, 2, 'Viewed the list of class schedules.', '2019-11-17 19:09:37'),
(3972, 2, 'Viewed the list of class schedules.', '2019-11-17 19:09:45'),
(3973, 2, 'Viewed the list of class schedules.', '2019-11-17 19:10:53'),
(3974, 2, 'Viewed the list of class schedules.', '2019-11-17 19:11:20'),
(3975, 2, 'Viewed the list of class schedules.', '2019-11-17 19:11:35'),
(3976, 2, 'Viewed the list of class schedules.', '2019-11-17 19:13:06'),
(3977, 2, 'Viewed the list of class schedules.', '2019-11-17 19:14:04'),
(3978, 2, 'Viewed the list of class schedules.', '2019-11-17 20:00:25'),
(3979, 2, 'Viewed the list of class schedules.', '2019-11-17 20:03:09'),
(3980, 2, 'Viewed the list of class schedules.', '2019-11-17 20:15:07'),
(3981, 2, 'Viewed the list of curriculums.', '2019-11-19 02:18:11'),
(3982, 2, 'Viewed the list of curriculums.', '2019-11-19 02:22:33'),
(3983, 2, 'Viewed the list of curriculums.', '2019-11-19 02:28:23'),
(3984, 2, 'Viewed the list of curriculums.', '2019-11-19 02:29:20'),
(3985, 2, 'Viewed the list of curriculums.', '2019-11-19 02:29:36'),
(3986, 2, 'Viewed the list of curriculums.', '2019-11-19 02:42:57'),
(3987, 2, 'Viewed the list of curriculums.', '2019-11-19 02:57:19'),
(3988, 2, 'Viewed the list of curriculums.', '2019-11-19 02:58:41'),
(3989, 2, 'Viewed the list of curriculums.', '2019-11-19 03:01:26'),
(3990, 2, 'Viewed the list of curriculums.', '2019-11-19 10:35:57'),
(3991, 2, 'Viewed the list of curriculums.', '2019-11-19 10:44:45'),
(3992, 2, 'Viewed the list of curriculums.', '2019-11-19 10:50:39'),
(3993, 2, 'Viewed the list of curriculums.', '2019-11-19 10:55:49'),
(3994, 2, 'Viewed the list of curriculums.', '2019-11-19 10:58:18'),
(3995, 2, 'Viewed the list of curriculums.', '2019-11-19 10:59:23'),
(3996, 1, 'Attempted to view the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:00:17'),
(3997, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:01:39'),
(3998, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:04:20'),
(3999, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:12:14'),
(4000, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:13:37'),
(4001, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:14:20'),
(4002, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:15:38'),
(4003, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:15:55'),
(4004, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:16:16'),
(4005, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:18:40'),
(4006, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:18:53'),
(4007, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:21:25'),
(4008, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:21:35'),
(4009, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:22:37'),
(4010, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:23:47'),
(4011, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:25:37'),
(4012, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:25:53'),
(4013, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:26:14'),
(4014, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:27:18'),
(4015, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 11:27:59'),
(4016, 2, 'Viewed the list of curriculums.', '2019-11-19 11:44:04'),
(4017, 2, 'Viewed the list of courses.', '2019-11-19 11:44:35'),
(4018, 2, 'Viewed the list of courses.', '2019-11-19 11:45:24'),
(4019, 2, 'Viewed the list of courses.', '2019-11-19 11:46:23'),
(4020, 2, 'Viewed the list of courses.', '2019-11-19 11:48:12'),
(4021, 2, 'Viewed the list of courses.', '2019-11-19 11:51:55'),
(4022, 2, 'Viewed the list of courses.', '2019-11-19 12:31:19'),
(4023, 2, 'Viewed the list of curriculums.', '2019-11-19 12:32:42'),
(4024, 2, 'Viewed the list of courses.', '2019-11-19 12:33:43'),
(4025, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:34:48'),
(4026, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:35:37'),
(4027, 2, 'Viewed the list of courses.', '2019-11-19 12:35:43'),
(4028, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:35:53'),
(4029, 2, 'Viewed the list of courses.', '2019-11-19 12:36:43'),
(4030, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:36:44'),
(4031, 2, 'Viewed the list of courses.', '2019-11-19 12:37:45'),
(4032, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:38:03'),
(4033, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:39:11'),
(4034, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:39:51'),
(4035, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:41:22'),
(4036, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:41:39'),
(4037, 2, 'Viewed the list of courses.', '2019-11-19 12:42:37'),
(4038, 2, 'Viewed the list of courses.', '2019-11-19 12:44:57'),
(4039, 2, 'Viewed the list of courses.', '2019-11-19 12:45:19'),
(4040, 2, 'Viewed the list of courses.', '2019-11-19 12:47:14'),
(4041, 2, 'Viewed the list of courses.', '2019-11-19 12:48:11'),
(4042, 2, 'Viewed the list of courses.', '2019-11-19 12:48:37'),
(4043, 2, 'Viewed the list of courses.', '2019-11-19 12:50:52'),
(4044, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:51:06'),
(4045, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:51:31'),
(4046, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:51:44'),
(4047, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:53:57'),
(4048, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:54:21'),
(4049, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 12:55:43'),
(4050, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:55:45'),
(4051, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:56:05'),
(4052, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:56:25'),
(4053, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:56:45'),
(4054, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 12:57:55'),
(4055, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:00:19'),
(4056, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:00:30'),
(4057, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:00:43'),
(4058, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:00:55'),
(4059, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:01:07'),
(4060, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:01:13'),
(4061, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:01:40'),
(4062, 2, 'Viewed the list of courses.', '2019-11-19 13:01:43'),
(4063, 2, 'Viewed the list of courses.', '2019-11-19 13:02:55'),
(4064, 2, 'Viewed the list of courses.', '2019-11-19 13:03:44'),
(4065, 2, 'Viewed the list of courses.', '2019-11-19 13:03:54'),
(4066, 2, 'Viewed the list of curriculums.', '2019-11-19 13:04:10'),
(4067, 2, 'Viewed the list of curriculums.', '2019-11-19 13:05:12'),
(4068, 2, 'Viewed the list of courses.', '2019-11-19 13:05:16'),
(4069, 2, 'Viewed the list of courses.', '2019-11-19 13:05:31'),
(4070, 2, 'Viewed the list of courses.', '2019-11-19 13:06:18'),
(4071, 2, 'Viewed the list of courses.', '2019-11-19 13:07:13'),
(4072, 2, 'Viewed the list of courses.', '2019-11-19 13:07:43'),
(4073, 2, 'Viewed the list of courses.', '2019-11-19 13:08:15'),
(4074, 2, 'Viewed the list of courses.', '2019-11-19 13:08:29'),
(4075, 2, 'Viewed the list of courses.', '2019-11-19 13:09:07'),
(4076, 2, 'Viewed the list of courses.', '2019-11-19 13:09:46'),
(4077, 2, 'Viewed the list of courses.', '2019-11-19 13:10:12'),
(4078, 2, 'Viewed the list of courses.', '2019-11-19 13:10:35'),
(4079, 2, 'Viewed the details of Bachelor of Science in Information Technology.', '2019-11-19 13:10:47'),
(4080, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 13:12:32'),
(4081, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 13:12:55'),
(4082, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 13:13:19'),
(4083, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-19 13:14:26'),
(4084, 2, 'Viewed the list of courses.', '2019-11-19 13:14:33'),
(4085, 2, 'Viewed the list of courses.', '2019-11-19 13:14:48'),
(4086, 2, 'Viewed the list of courses.', '2019-11-19 13:15:07'),
(4087, 2, 'Viewed the list of courses.', '2019-11-19 13:15:30'),
(4088, 2, 'Viewed the list of courses.', '2019-11-19 13:15:48'),
(4089, 2, 'Viewed the list of courses.', '2019-11-19 13:16:08'),
(4090, 2, 'Viewed the list of courses.', '2019-11-19 13:16:41'),
(4091, 2, 'Viewed the list of courses.', '2019-11-19 13:26:06'),
(4092, 2, 'Viewed the list of curriculums.', '2019-11-19 13:35:38'),
(4093, 2, 'Viewed the list of curriculums.', '2019-11-19 13:38:15'),
(4094, 2, 'Viewed the list of curriculums.', '2019-11-19 13:38:35'),
(4095, 2, 'Viewed the list of class schedules.', '2019-11-26 02:10:38'),
(4096, 2, 'Created a new subject.', '2019-11-26 02:12:00'),
(4097, 2, 'Created a new subject.', '2019-11-26 02:12:17'),
(4098, 2, 'Attempted to view the list of tracks.', '2019-11-26 02:13:10'),
(4099, 2, 'Attempted to view the list of tracks.', '2019-11-26 02:13:24'),
(4100, 2, 'Attempted to view the list of tracks.', '2019-11-26 02:13:41'),
(4101, 2, 'Attempted to view the list of tracks.', '2019-11-26 02:15:10'),
(4102, 2, 'Attempted to view the list of tracks.', '2019-11-26 02:15:23'),
(4103, 1, 'Attempted to create a new track.', '2019-11-26 02:17:38'),
(4104, 2, 'Attempted to create a new track.', '2019-11-26 02:17:51'),
(4105, 2, 'Viewed the list of tracks.', '2019-11-26 02:20:23'),
(4106, 2, 'Viewed the subject named CC102 from curriculum New Currculum BSIT.', '2019-11-26 02:23:01'),
(4107, 2, 'Viewed the list of curriculums.', '2019-11-26 02:23:35'),
(4108, 2, 'Viewed the list of rooms.', '2019-11-26 02:27:21'),
(4109, 2, 'Created a new class schedule.', '2019-11-26 02:50:00'),
(4110, 2, 'Viewed the list of class schedules.', '2019-11-26 02:54:54'),
(4111, 2, 'Created a new class schedule.', '2019-11-26 02:55:52'),
(4112, 2, 'Viewed the list of class schedules.', '2019-11-26 02:55:59'),
(4113, 2, 'Created a new class schedule.', '2019-11-26 03:00:00'),
(4114, 2, 'Created a new class schedule.', '2019-11-26 03:01:23'),
(4115, 2, 'Viewed the list of class schedules.', '2019-11-26 08:01:23'),
(4116, 2, 'Viewed the list of class schedules.', '2019-11-26 08:14:47'),
(4117, 2, 'Viewed the list of class schedules.', '2019-11-28 00:48:21'),
(4118, 2, 'Viewed the list of rooms.', '2019-11-29 01:58:46'),
(4119, 2, 'Viewed the list of rooms.', '2019-11-29 01:58:54'),
(4120, 2, 'Viewed the details of 414.', '2019-11-29 02:03:14'),
(4121, 2, 'Viewed the list of class schedules.', '2019-11-29 02:03:41'),
(4122, 2, 'Viewed the details of 406.', '2019-11-29 02:03:56'),
(4123, 2, 'Viewed the details of 406.', '2019-11-29 02:11:15'),
(4124, 1, 'Attempted to view the class schedules of 406.', '2019-11-29 02:11:41'),
(4125, 2, 'Viewed the class schedule of 406.', '2019-11-29 02:11:49'),
(4126, 2, 'Created a new room.', '2019-11-29 02:18:35'),
(4127, 2, 'Viewed the list of rooms.', '2019-11-29 02:19:12'),
(4128, 2, 'Viewed the list of rooms.', '2019-11-29 02:28:14'),
(4129, 2, 'Viewed the list of rooms.', '2019-11-29 02:28:20'),
(4130, 2, 'Viewed the list of rooms.', '2019-11-29 02:28:46'),
(4131, 2, 'Updated the room 500.', '2019-11-29 02:29:38'),
(4132, 2, 'Viewed the list of rooms.', '2019-11-29 02:29:44'),
(4133, 2, 'Deleted the room 413.', '2019-11-29 02:30:36'),
(4134, 2, 'Deleted the room 500.', '2019-11-29 02:30:45'),
(4135, 2, 'Viewed the list of rooms.', '2019-11-29 02:30:48'),
(4136, 2, 'Viewed the list of semesters.', '2019-11-29 02:31:10'),
(4137, 1, 'Attempted to view 2nd Semester.', '2019-11-29 02:31:29'),
(4138, 2, 'Viewed 2nd Semester.', '2019-11-29 02:31:35'),
(4139, 2, 'Viewed the list of semesters.', '2019-11-29 02:32:34'),
(4140, 2, 'Viewed the list of semesters.', '2019-11-29 02:33:05'),
(4141, 1, 'Attempted to update 3rd Semester.', '2019-11-29 02:33:11'),
(4142, 2, 'Updated 1st Semester.', '2019-11-29 02:33:37'),
(4143, 2, 'Viewed the list of semesters.', '2019-11-29 02:34:11'),
(4144, 2, 'Updated Edited Semester.', '2019-11-29 02:34:47'),
(4145, 2, 'Viewed the list of semesters.', '2019-11-29 02:34:51'),
(4146, 1, 'Attempted to delete Edited Semester.', '2019-11-29 02:34:57'),
(4147, 2, 'Deleted Edited Semester.', '2019-11-29 02:35:04'),
(4148, 2, 'Viewed the list of semesters.', '2019-11-29 02:35:07'),
(4149, 2, 'Viewed the list of subjects.', '2019-11-29 02:35:28'),
(4150, 2, 'Viewed the list of rooms.', '2019-11-29 02:38:37'),
(4151, 2, 'Viewed the details of 406.', '2019-11-29 02:38:46'),
(4152, 2, 'Viewed the details of 406.', '2019-11-29 02:39:05'),
(4153, 2, 'Viewed the details of 406.', '2019-11-29 02:41:47'),
(4154, 2, 'Viewed the details of 406.', '2019-11-29 02:41:55'),
(4155, 2, 'Viewed the list of subjects.', '2019-11-29 02:53:06'),
(4156, 1, 'Attempted to view the details of Entreprenuership.', '2019-11-29 02:53:30'),
(4157, 2, 'Viewed the details of Entreprenuership.', '2019-11-29 02:53:46'),
(4158, 2, 'Created a new subject.', '2019-11-29 02:54:14'),
(4159, 2, 'Viewed the list of subjects.', '2019-11-29 02:55:27'),
(4160, 2, 'Updated the subject Sample Description.', '2019-11-29 02:56:18'),
(4161, 2, 'Viewed the list of subjects.', '2019-11-29 02:56:23'),
(4162, 2, 'Deleted the subject Sample Description.', '2019-11-29 02:56:41'),
(4163, 2, 'Viewed the list of courses.', '2019-11-29 03:02:31'),
(4164, 2, 'Viewed the list of courses.', '2019-11-29 03:03:43'),
(4165, 2, 'Viewed the list of courses.', '2019-11-29 03:03:54'),
(4166, 2, 'Viewed the list of courses.', '2019-11-29 03:04:11'),
(4167, 2, 'Viewed the list of courses.', '2019-11-29 03:04:57'),
(4168, 2, 'Viewed the list of courses.', '2019-11-29 03:05:57'),
(4169, 2, 'Viewed the details of Associate in Computer Technology.', '2019-11-29 03:06:53'),
(4170, 2, 'Viewed the details of Associate in Computer Technology.', '2019-11-29 03:07:24'),
(4171, 2, 'Created a new course.', '2019-11-29 03:08:44'),
(4172, 2, 'Viewed the list of courses.', '2019-11-29 03:09:03'),
(4173, 2, 'Updated the course For deleting.', '2019-11-29 03:11:05'),
(4174, 2, 'Viewed the list of courses.', '2019-11-29 03:11:15'),
(4175, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2019-11-29 03:11:42'),
(4176, 2, 'Deleted the course For deleting.', '2019-11-29 03:13:15'),
(4177, 2, 'Viewed the list of courses.', '2019-11-29 03:13:19'),
(4178, 2, 'Viewed the list of academic years.', '2019-11-29 03:13:52'),
(4179, 1, 'Attempted to view the details of 2014-2015.', '2019-11-29 03:14:08'),
(4180, 2, 'Viewed the details of 2014-2015.', '2019-11-29 03:14:14'),
(4181, 2, 'Viewed the list of curriculums.', '2019-11-29 03:15:03'),
(4182, 2, 'Viewed the list of curriculums.', '2019-11-29 03:30:17'),
(4183, 2, 'Viewed the list of curriculums.', '2019-11-29 03:30:41'),
(4184, 2, 'Viewed the list of curriculums.', '2019-11-29 03:31:06'),
(4185, 2, 'Viewed the list of curriculums.', '2019-11-29 03:32:06'),
(4186, 2, 'Viewed the list of curriculums.', '2019-11-29 03:33:09'),
(4187, 2, 'Viewed the details of New Currculum BSIT.', '2019-11-29 03:34:14'),
(4188, 2, 'Viewed the list of curriculums.', '2019-11-29 03:39:15'),
(4189, 2, 'Viewed the list of curriculums.', '2019-11-29 03:51:30'),
(4190, 2, 'Viewed the details of New Currculum BSIT.', '2019-11-29 04:12:32'),
(4191, 2, 'Viewed the details of New Currculum BSIT.', '2019-11-29 04:14:49'),
(4192, 1, 'Attempted to delete the curriculum New Currculum ACT.', '2019-11-29 04:16:02'),
(4193, 2, 'Deleted the curriculum New Currculum ACT.', '2019-11-29 04:16:16'),
(4194, 2, 'Viewed the list of curriculums.', '2019-11-29 04:16:19'),
(4195, 2, 'Viewed the list of courses.', '2019-11-29 04:19:11'),
(4196, 2, 'Created a new curriculum.', '2019-11-29 04:19:26'),
(4197, 2, 'Viewed the list of curriculums.', '2019-11-29 04:19:30'),
(4198, 2, 'Viewed the list of curriculums.', '2019-11-29 04:19:53'),
(4199, 2, 'Viewed the details of New Currculum BSIT.', '2019-11-29 04:22:19'),
(4200, 2, 'Viewed the details of New Currculum BSIT.', '2019-11-29 04:22:19'),
(4201, 2, 'Viewed the details of New Currculum BSIT.', '2019-11-29 04:22:22'),
(4202, 2, 'Viewed the list of curriculums.', '2019-11-29 04:23:03'),
(4203, 2, 'Viewed the list of curriculums.', '2019-11-29 04:23:54'),
(4204, 2, 'Updated the curriculum New Currculum ACT.', '2019-11-29 04:24:30'),
(4205, 2, 'Viewed the list of curriculums.', '2019-11-29 04:24:46'),
(4206, 2, 'Viewed the list of strands.', '2019-11-29 04:49:07'),
(4207, 2, 'Viewed the list of tracks.', '2019-11-29 04:49:30'),
(4208, 1, 'Attempted to view the details of .', '2019-11-29 04:49:43'),
(4209, 2, 'Viewed the details of .', '2019-11-29 04:49:49'),
(4210, 2, 'Viewed the list of tracks.', '2019-11-29 04:54:04'),
(4211, 2, 'Viewed the list of tracks.', '2019-11-29 05:08:27'),
(4212, 2, 'Created a new track.', '2019-11-29 05:17:29'),
(4213, 2, 'Created a new track.', '2019-11-29 05:19:49'),
(4214, 2, 'Viewed the list of tracks.', '2019-11-29 05:19:52'),
(4215, 2, 'Viewed the list of tracks.', '2019-11-29 05:20:57'),
(4216, 2, 'Viewed the list of tracks.', '2019-11-29 05:21:48'),
(4217, 2, 'Viewed the list of tracks.', '2019-11-29 05:24:14'),
(4218, 2, 'Viewed the list of tracks.', '2019-11-29 05:24:35'),
(4219, 2, 'Updated the track Edited Track.', '2019-11-29 05:25:10'),
(4220, 2, 'Viewed the list of tracks.', '2019-11-29 05:25:16'),
(4221, 2, 'Updated the track Edited track.', '2019-11-29 05:25:52'),
(4222, 2, 'Viewed the list of tracks.', '2019-11-29 05:25:56'),
(4223, 2, 'Viewed the details of Edited track.', '2019-11-29 05:26:18'),
(4224, 2, 'Viewed the details of Edited track.', '2019-11-29 05:28:53'),
(4225, 2, 'Viewed the details of Edited track.', '2019-11-29 05:29:11'),
(4226, 2, 'Viewed the list of tracks.', '2019-11-29 05:29:59'),
(4227, 2, 'Viewed the list of tracks.', '2019-11-29 05:30:07'),
(4228, 2, 'Viewed the list of tracks.', '2019-11-29 05:30:18'),
(4229, 1, 'Attempted to delete the track Edited track.', '2019-11-29 05:30:21'),
(4230, 2, 'Deleted the track Edited track.', '2019-11-29 05:30:33'),
(4231, 2, 'Viewed the list of tracks.', '2019-11-29 05:30:38'),
(4232, 2, 'Viewed the list of strands.', '2019-11-29 05:34:23'),
(4233, 2, 'Created a new strand.', '2019-11-29 05:36:16'),
(4234, 2, 'Viewed the list of strands.', '2019-11-29 05:36:26'),
(4235, 2, 'Viewed the list of tracks.', '2019-11-29 05:36:44'),
(4236, 2, 'Viewed the list of strands.', '2019-11-29 05:37:28'),
(4237, 2, 'Deleted the strand Information in Communication Technology.', '2019-11-29 05:38:03'),
(4238, 2, 'Viewed the list of tracks.', '2019-11-29 05:38:08'),
(4239, 2, 'Created a new strand.', '2019-11-29 05:38:15'),
(4240, 2, 'Created a new strand.', '2019-11-29 05:38:29'),
(4241, 2, 'Viewed the list of strands.', '2019-11-29 05:40:00'),
(4242, 2, 'Updated the strand Edited.', '2019-11-29 05:40:39'),
(4243, 2, 'Viewed the list of strands.', '2019-11-29 05:40:46'),
(4244, 2, 'Viewed the list of tracks.', '2019-11-29 05:43:13'),
(4245, 2, 'Viewed the list of tracks.', '2019-11-29 05:43:42'),
(4246, 2, 'Viewed the list of tracks.', '2019-11-29 05:44:21'),
(4247, 2, 'Viewed the list of tracks.', '2019-11-29 05:45:24'),
(4248, 2, 'Viewed the list of tracks.', '2019-11-29 05:50:46'),
(4249, 2, 'Viewed the details of Edited Track.', '2019-11-29 05:51:03'),
(4250, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 05:56:43'),
(4251, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 05:58:03'),
(4252, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 05:59:55'),
(4253, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 06:00:13'),
(4254, 2, 'Viewed the subject named PE2 from curriculum New Currculum BSIT.', '2019-11-29 06:00:54'),
(4255, 2, 'Viewed the list of subjects.', '2019-11-29 06:21:37'),
(4256, 2, 'Created a new curriculum subject.', '2019-11-29 06:22:45'),
(4257, 2, 'Updated the curriculum subject named PE2 of  New Currculum BSIT.', '2019-11-29 06:23:24'),
(4258, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 06:23:28'),
(4259, 2, 'Updated the curriculum subject named ENT101 of  New Currculum BSIT.', '2019-11-29 06:23:50'),
(4260, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 06:23:53'),
(4261, 2, 'Viewed the subject named PE2 from curriculum New Currculum BSIT.', '2019-11-29 06:26:09'),
(4262, 2, 'Viewed the subject named PE2 from curriculum New Currculum BSIT.', '2019-11-29 06:27:09'),
(4263, 2, 'Viewed the subject named PE2 from curriculum New Currculum BSIT.', '2019-11-29 06:27:31'),
(4264, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 06:49:11'),
(4265, 2, 'Updated the curriculum subject named ENT101 of  New Currculum BSIT.', '2019-11-29 06:55:09'),
(4266, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 06:55:22'),
(4267, 2, 'Updated the curriculum subject named ENT101 of  New Currculum BSIT.', '2019-11-29 06:55:24'),
(4268, 2, 'Viewed the list of curriculum subjects.', '2019-11-29 06:55:28'),
(4269, 2, 'Viewed the subject named PE2 from curriculum New Currculum BSIT.', '2019-11-29 06:55:45'),
(4270, 2, 'Viewed the list of curriculum subjects.', '2019-12-02 16:10:24'),
(4271, 2, 'Viewed the list of class schedules.', '2019-12-02 16:31:40'),
(4272, 2, 'Viewed the list of rooms.', '2019-12-03 05:44:15'),
(4273, 2, 'Viewed the list of rooms.', '2019-12-03 05:58:26'),
(4274, 2, 'Viewed the list of curriculum subjects.', '2019-12-03 05:58:36'),
(4275, 2, 'Viewed the list of curriculum subjects.', '2019-12-03 06:06:42'),
(4276, 2, 'Viewed the list of class schedules.', '2019-12-03 06:53:27'),
(4277, 2, 'Viewed preferred subjects of instructors.', '2019-12-03 06:58:21'),
(4278, 2, 'Viewed the list of curriculum subjects.', '2019-12-03 06:59:12'),
(4279, 2, 'Viewed preferred subjects of instructors.', '2019-12-04 19:29:59'),
(4280, 2, 'Viewed preferred subjects of instructors.', '2019-12-04 19:31:58'),
(4281, 2, 'Viewed preferred subjects of instructors.', '2019-12-04 19:32:34'),
(4282, 2, 'Viewed the list of class schedules.', '2019-12-04 20:13:49'),
(4283, 2, 'Viewed the list of class schedules.', '2019-12-04 20:17:49'),
(4284, 2, 'Viewed preferred subjects of instructors.', '2019-12-04 20:56:27'),
(4285, 2, 'Created a new class schedule.', '2019-12-04 21:01:49'),
(4286, 2, 'Viewed the list of class schedules.', '2019-12-04 21:02:01'),
(4287, 2, 'Created a new class schedule.', '2019-12-04 21:03:17'),
(4288, 2, 'Created a new class schedule.', '2019-12-04 21:05:53'),
(4289, 2, 'Created a new class schedule.', '2019-12-04 21:06:09'),
(4290, 2, 'Created a new class schedule.', '2019-12-04 21:06:56'),
(4291, 2, 'Created a new class schedule.', '2019-12-04 21:12:13'),
(4292, 2, 'Created a new class schedule.', '2019-12-05 02:10:43'),
(4293, 2, 'Created a new class schedule.', '2019-12-05 09:31:53'),
(4294, 2, 'Created a new class schedule.', '2019-12-05 09:34:43'),
(4295, 2, 'Created a new class schedule.', '2019-12-05 09:38:20'),
(4296, 2, 'Created a new class schedule.', '2019-12-05 09:41:36'),
(4297, 2, 'Created a new class schedule.', '2019-12-05 09:44:40'),
(4298, 2, 'Created a new class schedule.', '2019-12-05 09:45:20'),
(4299, 2, 'Viewed the list of class schedules.', '2019-12-05 09:52:45'),
(4300, 2, 'Viewed the list of class schedules.', '2019-12-05 09:53:49'),
(4301, 2, 'Viewed the list of class schedules.', '2019-12-05 09:55:07'),
(4302, 2, 'Viewed the list of class schedules.', '2019-12-05 09:55:33'),
(4303, 2, 'Viewed the list of class schedules.', '2019-12-05 09:56:34'),
(4304, 2, 'Viewed the list of class schedules.', '2019-12-05 09:57:39'),
(4305, 2, 'Viewed the list of class schedules.', '2019-12-05 10:01:58'),
(4306, 2, 'Viewed the list of class schedules.', '2019-12-05 10:04:33'),
(4307, 2, 'Viewed the list of class schedules.', '2019-12-05 10:06:04'),
(4308, 2, 'Viewed the list of class schedules.', '2019-12-05 10:09:53'),
(4309, 2, 'Viewed the list of class schedules.', '2019-12-05 10:10:19'),
(4310, 2, 'Viewed the list of class schedules.', '2019-12-05 10:10:36'),
(4311, 2, 'Viewed list of user accounts.', '2019-12-05 10:13:44'),
(4312, 2, 'Viewed list of user accounts.', '2019-12-05 10:14:11'),
(4313, 2, 'Updated user account of admin.', '2019-12-05 10:14:52'),
(4314, 2, 'Viewed the list of class schedules.', '2019-12-05 10:28:52'),
(4315, 2, 'Viewed the list of class schedules.', '2019-12-05 10:29:41'),
(4316, 2, 'Viewed the list of class schedules.', '2019-12-05 10:31:17'),
(4317, 2, 'Viewed the list of class schedules.', '2019-12-05 10:31:47'),
(4318, 2, 'Viewed the list of class schedules.', '2019-12-05 10:36:14'),
(4319, 2, 'Viewed the list of class schedules.', '2019-12-05 10:37:06'),
(4320, 2, 'Viewed the list of class schedules.', '2019-12-05 10:39:20'),
(4321, 2, 'Viewed the list of class schedules.', '2019-12-05 10:55:13'),
(4322, 2, 'Viewed the list of rooms.', '2019-12-05 10:55:41'),
(4323, 2, 'Viewed the list of class schedules.', '2019-12-05 10:58:12'),
(4324, 2, 'Viewed the list of curriculum subjects.', '2019-12-05 11:02:33'),
(4325, 2, 'Viewed the list of curriculum subjects.', '2019-12-05 11:04:06'),
(4326, 2, 'Viewed the subject named PE2 from curriculum New Currculum BSIT.', '2019-12-05 11:05:41'),
(4327, 1, 'Attempted to view the subjects of curriculum New Currculum BSIT.', '2019-12-05 11:06:18'),
(4328, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2019-12-05 11:06:38'),
(4329, 2, 'Viewed the list of instructors.', '2019-12-05 11:07:54'),
(4330, 2, 'Viewed instructor record of Joy, Arvee.', '2019-12-05 11:09:03'),
(4331, 2, 'Viewed the list of curriculums.', '2019-12-05 11:10:21'),
(4332, 2, 'Viewed instructor availabilities.', '2019-12-09 23:35:19'),
(4333, 2, 'Viewed instructor availabilities.', '2019-12-09 23:35:19'),
(4334, 2, 'Viewed instructor availabilities.', '2019-12-09 23:37:06'),
(4335, 2, 'Viewed instructor record of Marcelino, Noel.', '2019-12-09 23:39:40'),
(4336, 2, 'Viewed instructor record of Marcelino, Noel.', '2019-12-09 23:41:06'),
(4337, 2, 'Viewed instructor record of Marcelino, Noel.', '2019-12-09 23:41:36'),
(4338, 2, 'Viewed instructor record of Marcelino, Noel.', '2019-12-09 23:45:01'),
(4339, 2, 'Viewed instructor record of Marcelino, Noel.', '2019-12-09 23:48:24'),
(4340, 2, 'Viewed the list of instructors.', '2019-12-10 02:15:34'),
(4341, 2, 'Viewed the list of instructors.', '2019-12-10 02:15:34'),
(4342, 2, 'Viewed the list of class schedules.', '2019-12-10 02:26:10'),
(4343, 2, 'Viewed the list of courses.', '2020-01-02 10:14:55'),
(4344, 2, 'Viewed the list of courses.', '2020-01-02 10:14:55'),
(4345, 2, 'Updated the course Bachelor of Science in Accountancy.', '2020-01-02 10:18:39'),
(4346, 2, 'Viewed the list of courses.', '2020-01-02 10:18:45'),
(4347, 2, 'Viewed the list of courses.', '2020-01-02 10:18:49'),
(4348, 2, 'Viewed the list of courses.', '2020-01-02 10:19:00'),
(4349, 2, 'Updated the course Bachelor of Science in Accountancy.', '2020-01-02 10:19:49'),
(4350, 2, 'Viewed the list of courses.', '2020-01-02 10:19:52'),
(4351, 2, 'Viewed the list of class schedules.', '2020-01-05 11:31:54'),
(4352, 2, 'Viewed the list of class schedules.', '2020-01-05 11:31:54'),
(4353, 2, 'Viewed the list of class schedules.', '2020-01-05 11:36:11'),
(4354, 2, 'Viewed the list of class schedules.', '2020-01-05 11:36:16'),
(4355, 2, 'Viewed the list of class schedules.', '2020-01-05 11:37:11'),
(4356, 2, 'Viewed the list of class schedules.', '2020-01-05 11:37:30'),
(4357, 2, 'Viewed the list of class schedules.', '2020-01-05 11:38:08'),
(4358, 2, 'Viewed the list of class schedules.', '2020-01-05 11:38:23'),
(4359, 2, 'Viewed the list of class schedules.', '2020-01-05 11:38:37'),
(4360, 2, 'Viewed the list of class schedules.', '2020-01-05 11:39:54'),
(4361, 2, 'Viewed the list of class schedules.', '2020-01-05 11:44:15'),
(4362, 2, 'Viewed the list of class schedules.', '2020-01-05 11:44:35'),
(4363, 2, 'Viewed the list of class schedules.', '2020-01-05 11:53:30'),
(4364, 2, 'Viewed the list of class schedules.', '2020-01-05 11:57:49'),
(4365, 2, 'Viewed the list of courses.', '2020-01-05 11:58:53'),
(4366, 2, 'Viewed the list of class schedules.', '2020-01-05 11:59:00'),
(4367, 2, 'Viewed the list of class schedules.', '2020-01-05 11:59:22'),
(4368, 2, 'Viewed the list of class schedules.', '2020-01-05 11:59:43'),
(4369, 2, 'Viewed the list of class schedules.', '2020-01-05 11:59:53'),
(4370, 2, 'Viewed the list of class schedules.', '2020-01-05 12:00:55'),
(4371, 2, 'Viewed the list of class schedules.', '2020-01-05 12:05:15'),
(4372, 2, 'Viewed the list of class schedules.', '2020-01-05 12:05:48'),
(4373, 2, 'Viewed the list of class schedules.', '2020-01-05 12:08:24'),
(4374, 2, 'Viewed the list of class schedules.', '2020-01-05 12:08:38'),
(4375, 2, 'Viewed the list of class schedules.', '2020-01-05 12:09:43'),
(4376, 2, 'Viewed the list of class schedules.', '2020-01-05 12:15:07'),
(4377, 2, 'Viewed the list of class schedules.', '2020-01-05 12:15:59'),
(4378, 2, 'Viewed the list of class schedules.', '2020-01-05 12:26:06'),
(4379, 2, 'Viewed the list of class schedules.', '2020-01-05 12:26:06'),
(4380, 2, 'Viewed the list of class schedules.', '2020-01-05 12:26:14'),
(4381, 2, 'Viewed the list of class schedules.', '2020-01-05 12:31:01'),
(4382, 2, 'Viewed the list of class schedules.', '2020-01-05 12:31:20'),
(4383, 2, 'Viewed the list of class schedules.', '2020-01-05 12:33:36'),
(4384, 2, 'Viewed the list of class schedules.', '2020-01-05 12:39:49'),
(4385, 2, 'Viewed the list of class schedules.', '2020-01-05 12:41:04'),
(4386, 2, 'Created a new student record.', '2020-01-05 16:56:10'),
(4387, 2, 'Viewed the list of students.', '2020-01-05 16:57:29'),
(4388, 2, 'Viewed the list of students.', '2020-01-05 16:58:40'),
(4389, 2, 'Created a new student record.', '2020-01-05 17:18:26'),
(4390, 2, 'Viewed the list of students.', '2020-01-05 17:18:32'),
(4391, 2, 'Created a new student record.', '2020-01-05 17:37:32'),
(4392, 2, 'Created a new student record.', '2020-01-05 17:39:27'),
(4393, 2, 'Viewed the list of students.', '2020-01-05 18:14:00'),
(4394, 2, 'Viewed the list of class schedules.', '2020-01-06 12:19:58'),
(4395, 2, 'Viewed the list of class schedules.', '2020-01-06 12:21:22'),
(4396, 2, 'Viewed the list of class schedules.', '2020-01-06 12:22:58'),
(4397, 2, 'Viewed the list of class schedules.', '2020-01-07 11:07:36'),
(4398, 2, 'Viewed the list of courses.', '2020-01-07 11:37:43'),
(4399, 2, 'Viewed the list of courses.', '2020-01-07 11:40:01'),
(4400, 2, 'Viewed the list of courses.', '2020-01-07 11:42:17'),
(4401, 2, 'Viewed the list of courses.', '2020-01-07 11:42:40'),
(4402, 2, 'Viewed the list of courses.', '2020-01-07 11:42:52'),
(4403, 2, 'Viewed the list of courses.', '2020-01-07 11:44:41'),
(4404, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-07 11:46:55'),
(4405, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-07 11:47:14'),
(4406, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-07 11:47:28'),
(4407, 2, 'Viewed the list of courses.', '2020-01-07 11:52:22'),
(4408, 2, 'Viewed the list of courses.', '2020-01-07 11:52:27'),
(4409, 2, 'Viewed the list of courses.', '2020-01-07 11:58:16'),
(4410, 2, 'Viewed the list of courses.', '2020-01-07 12:01:41'),
(4411, 2, 'Viewed the list of courses.', '2020-01-07 12:02:21'),
(4412, 2, 'Viewed the list of courses.', '2020-01-07 12:03:13'),
(4413, 2, 'Viewed the list of courses.', '2020-01-07 12:03:20'),
(4414, 2, 'Viewed the list of courses.', '2020-01-07 12:03:40'),
(4415, 2, 'Viewed the list of courses.', '2020-01-07 12:04:20'),
(4416, 2, 'Created a new student schedule.', '2020-01-13 17:22:29'),
(4417, 2, 'Updated the student schedule 2.', '2020-01-14 00:39:54'),
(4418, 2, 'Updated the student schedule 2.', '2020-01-14 00:40:43'),
(4419, 2, 'Updated the student schedule 2.', '2020-01-14 00:41:08'),
(4420, 2, 'Updated the student schedule 2.', '2020-01-14 00:41:28'),
(4421, 2, 'Viewed the details of 2.', '2020-01-14 00:41:53'),
(4422, 2, 'Viewed the list of student schedule.', '2020-01-14 00:42:00'),
(4423, 2, 'Viewed the list of student requirements.', '2020-01-14 00:43:01'),
(4424, 2, 'Viewed the list of student requirements.', '2020-01-14 00:44:06'),
(4425, 2, 'Viewed the list of class schedules.', '2020-01-14 03:18:54'),
(4426, 2, 'Viewed the list of class schedules.', '2020-01-14 03:18:54'),
(4427, 2, 'Viewed the list of class schedules.', '2020-01-14 03:19:41');
INSERT INTO `activity_logs` (`id`, `user_id`, `activity`, `time`) VALUES
(4428, 2, 'Viewed the list of class schedules.', '2020-01-14 03:23:19'),
(4429, 2, 'Viewed instructor record of Marcelino, Noel.', '2020-01-14 03:23:37'),
(4430, 2, 'Viewed instructor record of Marcelino, Noel.', '2020-01-14 03:25:53'),
(4431, 2, 'Viewed instructor record of Marcelino, Noel.', '2020-01-14 03:26:40'),
(4432, 2, 'Viewed the list of courses.', '2020-01-14 06:54:07'),
(4433, 2, 'Viewed the list of courses.', '2020-01-14 06:55:02'),
(4434, 2, 'Viewed the list of courses.', '2020-01-14 06:55:12'),
(4435, 2, 'Viewed the list of curriculums.', '2020-01-14 06:55:59'),
(4436, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 06:56:08'),
(4437, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 06:57:47'),
(4438, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 06:58:33'),
(4439, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 06:58:46'),
(4440, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:00:02'),
(4441, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:00:24'),
(4442, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:02:04'),
(4443, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:02:16'),
(4444, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:02:58'),
(4445, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:03:09'),
(4446, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:03:21'),
(4447, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:03:37'),
(4448, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:03:45'),
(4449, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:03:55'),
(4450, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:04:02'),
(4451, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:06:00'),
(4452, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 07:06:24'),
(4453, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-14 07:21:46'),
(4454, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-14 07:22:09'),
(4455, 2, 'Viewed the details of Associate in Computer Technology.', '2020-01-14 08:15:09'),
(4456, 2, 'Viewed the list of class schedules.', '2020-01-14 08:15:37'),
(4457, 2, 'Viewed the class schedule of 406.', '2020-01-14 11:33:28'),
(4458, 2, 'Viewed the class schedule of 406.', '2020-01-14 11:50:04'),
(4459, 2, 'Viewed the class schedule of 406.', '2020-01-14 11:50:04'),
(4460, 2, 'Viewed the class schedule of 406.', '2020-01-14 11:59:34'),
(4461, 2, 'Viewed the list of class schedules.', '2020-01-17 12:15:10'),
(4462, 2, 'Viewed the list of class schedules.', '2020-01-17 12:15:53'),
(4463, 2, 'Viewed the list of class schedules.', '2020-01-17 12:16:29'),
(4464, 2, 'Viewed the list of class schedules.', '2020-01-17 12:16:37'),
(4465, 2, 'Viewed the list of class schedules.', '2020-01-17 12:17:39'),
(4466, 2, 'Viewed the list of class schedules.', '2020-01-17 12:18:20'),
(4467, 2, 'Viewed the list of class schedules.', '2020-01-17 12:23:23'),
(4468, 2, 'Viewed the list of class schedules.', '2020-01-17 12:25:23'),
(4469, 2, 'Viewed the list of class schedules.', '2020-01-17 12:25:41'),
(4470, 2, 'Viewed the list of class schedules.', '2020-01-17 12:27:59'),
(4471, 2, 'Viewed the list of class schedules.', '2020-01-17 12:28:39'),
(4472, 2, 'Viewed the list of class schedules.', '2020-01-17 12:28:58'),
(4473, 2, 'Viewed the list of class schedules.', '2020-01-17 12:29:05'),
(4474, 2, 'Viewed the list of class schedules.', '2020-01-17 12:29:19'),
(4475, 2, 'Viewed the list of class schedules.', '2020-01-17 12:29:28'),
(4476, 2, 'Viewed the list of class schedules.', '2020-01-17 12:29:55'),
(4477, 2, 'Viewed the list of class schedules.', '2020-01-17 12:30:30'),
(4478, 2, 'Viewed the list of class schedules.', '2020-01-17 12:30:50'),
(4479, 2, 'Viewed the list of class schedules.', '2020-01-17 12:30:57'),
(4480, 2, 'Viewed the list of class schedules.', '2020-01-17 12:32:04'),
(4481, 2, 'Viewed the list of class schedules.', '2020-01-17 12:33:02'),
(4482, 2, 'Viewed the list of class schedules.', '2020-01-17 12:33:24'),
(4483, 2, 'Viewed the list of class schedules.', '2020-01-17 12:33:37'),
(4484, 2, 'Viewed the list of class schedules.', '2020-01-17 12:34:22'),
(4485, 2, 'Viewed the list of class schedules.', '2020-01-17 12:34:32'),
(4486, 2, 'Viewed the list of class schedules.', '2020-01-17 12:35:16'),
(4487, 2, 'Viewed the list of class schedules.', '2020-01-17 12:35:37'),
(4488, 2, 'Viewed the list of class schedules.', '2020-01-17 12:35:59'),
(4489, 2, 'Viewed the list of class schedules.', '2020-01-17 12:36:06'),
(4490, 2, 'Viewed the list of class schedules.', '2020-01-17 12:36:14'),
(4491, 2, 'Viewed the list of class schedules.', '2020-01-17 12:36:30'),
(4492, 2, 'Viewed the list of class schedules.', '2020-01-17 12:37:38'),
(4493, 2, 'Viewed the list of class schedules.', '2020-01-17 12:38:09'),
(4494, 2, 'Viewed the list of class schedules.', '2020-01-17 12:38:44'),
(4495, 2, 'Viewed the list of class schedules.', '2020-01-17 12:39:03'),
(4496, 2, 'Viewed the list of class schedules.', '2020-01-17 12:39:39'),
(4497, 2, 'Viewed the list of class schedules.', '2020-01-17 12:40:41'),
(4498, 2, 'Viewed the list of class schedules.', '2020-01-17 12:40:58'),
(4499, 2, 'Viewed the list of class schedules.', '2020-01-17 12:41:19'),
(4500, 2, 'Viewed the list of class schedules.', '2020-01-17 12:43:22'),
(4501, 2, 'Viewed the list of class schedules.', '2020-01-17 12:47:24'),
(4502, 2, 'Viewed the list of class schedules.', '2020-01-17 12:47:41'),
(4503, 2, 'Viewed the list of class schedules.', '2020-01-17 12:48:04'),
(4504, 2, 'Viewed the list of class schedules.', '2020-01-17 12:48:42'),
(4505, 2, 'Viewed the list of class schedules.', '2020-01-17 12:57:32'),
(4506, 2, 'Viewed the list of class schedules.', '2020-01-17 12:57:50'),
(4507, 2, 'Viewed the list of class schedules.', '2020-01-17 12:58:37'),
(4508, 2, 'Viewed the list of class schedules.', '2020-01-17 12:58:50'),
(4509, 2, 'Viewed the list of class schedules.', '2020-01-17 13:00:01'),
(4510, 2, 'Viewed the list of class schedules.', '2020-01-17 13:01:25'),
(4511, 2, 'Viewed the list of class schedules.', '2020-01-17 13:04:30'),
(4512, 2, 'Viewed the list of class schedules.', '2020-01-17 13:04:42'),
(4513, 2, 'Viewed the list of class schedules.', '2020-01-17 13:05:16'),
(4514, 2, 'Viewed the list of class schedules.', '2020-01-17 13:12:56'),
(4515, 2, 'Viewed the list of class schedules.', '2020-01-17 13:14:53'),
(4516, 2, 'Viewed the list of class schedules.', '2020-01-17 13:16:42'),
(4517, 2, 'Viewed the list of class schedules.', '2020-01-17 13:17:47'),
(4518, 2, 'Viewed the list of class schedules.', '2020-01-17 13:19:10'),
(4519, 2, 'Viewed the list of class schedules.', '2020-01-17 13:19:36'),
(4520, 2, 'Viewed the list of class schedules.', '2020-01-17 13:20:41'),
(4521, 2, 'Viewed the list of class schedules.', '2020-01-17 13:22:49'),
(4522, 2, 'Viewed the list of class schedules.', '2020-01-17 13:24:12'),
(4523, 2, 'Viewed the list of class schedules.', '2020-01-17 13:29:26'),
(4524, 2, 'Viewed the list of class schedules.', '2020-01-17 13:29:50'),
(4525, 2, 'Viewed the list of class schedules.', '2020-01-17 13:30:00'),
(4526, 2, 'Viewed the list of class schedules.', '2020-01-17 13:32:08'),
(4527, 2, 'Viewed the list of class schedules.', '2020-01-17 13:44:54'),
(4528, 2, 'Viewed the list of class schedules.', '2020-01-17 13:45:34'),
(4529, 2, 'Viewed the list of class schedules.', '2020-01-17 13:46:39'),
(4530, 2, 'Viewed the list of class schedules.', '2020-01-17 13:50:07'),
(4531, 2, 'Viewed the list of class schedules.', '2020-01-17 13:50:50'),
(4532, 2, 'Viewed the list of class schedules.', '2020-01-17 13:57:26'),
(4533, 2, 'Viewed the list of class schedules.', '2020-01-17 13:58:57'),
(4534, 2, 'Viewed the list of class schedules.', '2020-01-17 14:02:14'),
(4535, 2, 'Viewed the list of class schedules.', '2020-01-17 14:03:19'),
(4536, 2, 'Viewed the list of class schedules.', '2020-01-17 14:05:26'),
(4537, 2, 'Viewed the list of class schedules.', '2020-01-17 14:59:21'),
(4538, 2, 'Viewed the list of class schedules.', '2020-01-17 14:59:40'),
(4539, 2, 'Viewed the list of class schedules.', '2020-01-17 15:00:21'),
(4540, 2, 'Viewed the list of class schedules.', '2020-01-17 15:02:24'),
(4541, 2, 'Viewed the list of class schedules.', '2020-01-17 15:02:55'),
(4542, 2, 'Viewed the list of class schedules.', '2020-01-17 15:03:39'),
(4543, 2, 'Viewed the list of class schedules.', '2020-01-17 15:04:36'),
(4544, 2, 'Viewed the list of class schedules.', '2020-01-17 15:05:08'),
(4545, 2, 'Viewed the list of class schedules.', '2020-01-17 15:16:04'),
(4546, 2, 'Viewed the list of class schedules.', '2020-01-17 15:17:26'),
(4547, 2, 'Viewed the list of class schedules.', '2020-01-17 15:19:48'),
(4548, 2, 'Viewed the list of class schedules.', '2020-01-17 15:20:45'),
(4549, 2, 'Viewed the list of class schedules.', '2020-01-17 15:24:07'),
(4550, 2, 'Viewed the list of class schedules.', '2020-01-17 15:25:30'),
(4551, 2, 'Viewed the list of class schedules.', '2020-01-17 15:25:57'),
(4552, 2, 'Viewed the list of class schedules.', '2020-01-17 15:26:17'),
(4553, 2, 'Viewed the list of class schedules.', '2020-01-17 15:26:22'),
(4554, 2, 'Viewed the list of class schedules.', '2020-01-17 15:31:29'),
(4555, 2, 'Viewed the list of class schedules.', '2020-01-17 15:31:45'),
(4556, 2, 'Viewed the list of class schedules.', '2020-01-17 15:33:23'),
(4557, 2, 'Viewed the list of class schedules.', '2020-01-17 21:56:04'),
(4558, 2, 'Viewed the list of class schedules.', '2020-01-17 21:58:07'),
(4559, 2, 'Viewed the list of class schedules.', '2020-01-17 22:26:40'),
(4560, 2, 'Viewed the list of class schedules.', '2020-01-18 12:38:21'),
(4561, 1, 'Attempted to view the details of 27.', '2020-01-18 12:39:13'),
(4562, 1, 'Attempted to view the details of 27.', '2020-01-18 12:46:36'),
(4563, 2, 'Viewed the details of 27.', '2020-01-18 12:50:47'),
(4564, 2, 'Viewed the details of 27.', '2020-01-18 12:57:17'),
(4565, 2, 'Viewed the details of 27.', '2020-01-18 12:57:34'),
(4566, 2, 'Viewed the details of 27.', '2020-01-18 12:58:29'),
(4567, 2, 'Viewed the details of 27.', '2020-01-18 13:03:06'),
(4568, 2, 'Viewed the details of 27.', '2020-01-18 13:03:23'),
(4569, 2, 'Viewed the details of 27.', '2020-01-18 13:03:46'),
(4570, 2, 'Viewed the details of 27.', '2020-01-18 13:05:08'),
(4571, 2, 'Viewed the details of 27.', '2020-01-18 13:06:25'),
(4572, 2, 'Viewed the details of 27.', '2020-01-18 13:07:59'),
(4573, 2, 'Viewed the details of 27.', '2020-01-18 13:08:38'),
(4574, 2, 'Viewed the details of 27.', '2020-01-18 13:08:57'),
(4575, 2, 'Viewed the details of 27.', '2020-01-18 13:09:25'),
(4576, 2, 'Viewed the details of 27.', '2020-01-18 13:10:06'),
(4577, 2, 'Viewed the details of 27.', '2020-01-18 13:10:26'),
(4578, 2, 'Viewed the details of 27.', '2020-01-18 13:11:29'),
(4579, 2, 'Viewed the details of 27.', '2020-01-18 13:11:50'),
(4580, 2, 'Created a new student record.', '2020-01-18 13:36:34'),
(4581, 2, 'Viewed the list of students.', '2020-01-18 13:36:42'),
(4582, 2, 'Viewed the list of students.', '2020-01-18 13:37:20'),
(4583, 2, 'Created a new student record.', '2020-01-18 13:37:48'),
(4584, 2, 'Viewed the list of students.', '2020-01-18 13:38:01'),
(4585, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-18 13:50:27'),
(4586, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-18 13:51:46'),
(4587, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-18 13:54:07'),
(4588, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-18 13:54:14'),
(4589, 2, 'Viewed the list of courses.', '2020-01-18 13:54:32'),
(4590, 2, 'Viewed the curriculums of Associate in Computer Technology.', '2020-01-18 13:54:48'),
(4591, 2, 'Created a new curriculum.', '2020-01-18 14:07:57'),
(4592, 2, 'Viewed the list of courses.', '2020-01-18 14:10:28'),
(4593, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-18 14:14:48'),
(4594, 2, 'Viewed the curriculums of Bachelor of Science in Information Technology.', '2020-01-18 14:17:52'),
(4595, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 14:29:39'),
(4596, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 14:31:00'),
(4597, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 14:33:38'),
(4598, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 14:42:00'),
(4599, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 14:42:49'),
(4600, 2, 'Viewed the list of class schedules.', '2020-01-18 14:44:54'),
(4601, 2, 'Viewed the list of class schedules.', '2020-01-18 14:55:12'),
(4602, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 14:55:33'),
(4603, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 14:57:04'),
(4604, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-18 15:04:36'),
(4605, 2, 'Created a new student requirement.', '2020-01-23 14:38:10'),
(4606, 2, 'Created a new student requirement.', '2020-01-23 14:44:28'),
(4607, 2, 'Viewed the list of class schedules.', '2020-01-23 14:45:03'),
(4608, 2, 'Viewed the subjects of curriculum New Currculum BSIT.', '2020-01-23 14:45:14'),
(4609, 2, 'Created a new student requirement.', '2020-01-23 14:45:17'),
(4610, 2, 'Created a new student requirement.', '2020-01-23 15:18:19'),
(4611, 2, 'Created a new student requirement.', '2020-01-23 15:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `per_unit` decimal(8,2) NOT NULL,
  `misc_fee` decimal(8,2) NOT NULL,
  `hands_on_fee` decimal(8,2) NOT NULL,
  `lab_fee` decimal(8,2) NOT NULL,
  `internet_fee` decimal(8,2) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `scholarship` varchar(100) DEFAULT NULL,
  `cash` tinyint(4) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `figure` decimal(8,2) DEFAULT NULL,
  `tuition` decimal(8,2) DEFAULT NULL,
  `miscs` decimal(8,2) DEFAULT NULL,
  `hands_on` decimal(8,2) DEFAULT NULL,
  `hands_on_qty` int(11) DEFAULT NULL,
  `laboratory` decimal(8,2) DEFAULT NULL,
  `laboratory_qty` int(11) DEFAULT NULL,
  `hrm_lab` decimal(8,2) DEFAULT NULL,
  `hrm_lab_qty` int(11) DEFAULT NULL,
  `internet` decimal(8,2) DEFAULT NULL,
  `computer_lab` decimal(8,3) DEFAULT NULL,
  `id_fee` varchar(45) DEFAULT NULL,
  `others` varchar(45) DEFAULT NULL,
  `less_discount` varchar(45) DEFAULT NULL,
  `surcharge` varchar(45) DEFAULT NULL,
  `pre_balance` varchar(45) DEFAULT NULL,
  `total_tuition` varchar(45) DEFAULT NULL,
  `total_paid` varchar(45) DEFAULT NULL,
  `balance` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_schedules`
--

CREATE TABLE `class_schedules` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `day` text DEFAULT NULL,
  `time_start` text DEFAULT NULL,
  `time_end` text DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `block` tinyint(1) NOT NULL,
  `batch` tinyint(1) NOT NULL,
  `class_type` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_schedules`
--

INSERT INTO `class_schedules` (`id`, `subject_id`, `day`, `time_start`, `time_end`, `room_id`, `instructor_id`, `block`, `batch`, `class_type`, `created_at`, `updated_at`, `last_updated_by`, `academic_year_id`, `semester_id`) VALUES
(11, 22, 'Monday', '08:00', '09:00', 40, 63, 1, 1, 'Lecture', '2019-11-26 08:25:57', '2019-11-26 08:25:57', 2, 6, 3),
(21, 23, 'Monday', '09:00', '10:00', 40, 63, 1, 1, 'Lecture', '2019-12-05 02:10:43', '2019-12-05 02:10:43', 2, 6, 3),
(26, 24, 'Monday', '10:00', '11:00', 40, 63, 1, 1, 'Lecture', '2019-12-05 09:44:40', '2019-12-05 09:44:40', 2, 6, 3),
(27, 24, 'Monday', '11:00', '13:30', 40, 63, 1, 1, 'Laboratory', '2019-12-05 11:02:07', '2019-12-05 11:02:07', 2, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(15) NOT NULL,
  `course_desc` text NOT NULL,
  `course_major` text DEFAULT NULL,
  `year_duration` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_desc`, `course_major`, `year_duration`, `active`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(9, 'ACT', 'Associate in Computer Technology', NULL, '2 years', 1, '2019-11-11 06:22:03', '2019-11-11 06:22:03', 2),
(10, 'BSIT', 'Bachelor of Science in Information Technology', NULL, '4 years', 1, '2019-11-11 06:22:33', '2019-11-11 06:22:33', 2),
(11, 'BSCS', 'Bachelor of Science in Computer Science', NULL, '4 years', 1, '2019-11-11 06:22:48', '2019-11-11 06:22:48', 2),
(12, 'BSBA-OM', 'Bachelor of Science in Business Administration', 'Operations Management', '4 years', 1, '2019-11-11 06:23:57', '2019-11-11 06:23:57', 2),
(13, 'BSBA-HRDM', 'Bachelor of Science in Business Administration', 'Human Resource Development Management', '4 years', 1, '2019-11-11 06:24:50', '2019-11-11 06:24:50', 2),
(14, 'edit done', 'Bachelor of Science in Accountancy', NULL, '4 years', 1, '2019-11-11 06:25:24', '2020-01-02 10:19:49', 2);

-- --------------------------------------------------------

--
-- Table structure for table `curriculums`
--

CREATE TABLE `curriculums` (
  `id` int(11) NOT NULL,
  `curriculum_title` text NOT NULL,
  `curriculum_desc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `strand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculums`
--

INSERT INTO `curriculums` (`id`, `curriculum_title`, `curriculum_desc`, `created_at`, `updated_at`, `last_updated_by`, `course_id`, `strand_id`) VALUES
(22, 'New Currculum BSIT', 'New Curriculum for BSIT S.Y. 2018-2019', '2019-11-14 12:23:18', '2019-11-14 12:23:18', 2, 10, NULL),
(24, 'New Currculum ACT', 'New Description', '2019-11-29 04:19:26', '2019-11-29 04:24:30', 2, 9, NULL),
(25, '2018-2019 BSIT', 'Curriculum for BS Information Technology School Year 2018-2019', '2020-01-18 14:07:57', '2020-01-18 14:07:57', 2, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_subjects`
--

CREATE TABLE `curriculum_subjects` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `year_level` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum_subjects`
--

INSERT INTO `curriculum_subjects` (`id`, `subject_id`, `curriculum_id`, `semester_id`, `year_level`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(19, 20, 22, 3, '1st Year', '2019-11-14 12:34:49', '2019-11-14 12:34:49', 2),
(20, 21, 22, 3, '1st Year', '2019-11-14 12:34:53', '2019-11-14 12:34:53', 2),
(21, 22, 22, 3, '1st Year', '2019-11-14 12:34:58', '2019-11-14 12:34:58', 2),
(22, 23, 22, 3, '1st Year', '2019-11-14 12:35:01', '2019-11-14 12:35:01', 2),
(23, 24, 22, 3, '1st Year', '2019-11-14 12:35:05', '2019-11-14 12:35:05', 2),
(24, 25, 22, 3, '1st Year', '2019-11-14 12:35:08', '2019-11-14 12:35:08', 2),
(25, 26, 22, 3, '1st Year', '2019-11-17 16:33:03', '2019-11-17 16:33:03', 2),
(26, 27, 22, 3, '1st Year', '2019-11-17 16:33:07', '2019-11-17 16:33:07', 2),
(27, 28, 22, 3, '1st Year', '2019-11-17 16:33:11', '2019-11-17 16:33:11', 2),
(28, 29, 22, 3, '1st Year', '2019-11-17 16:33:15', '2019-11-17 16:33:15', 2),
(29, 30, 22, 3, '1st Year', '2019-11-17 16:33:18', '2019-11-17 16:33:18', 2),
(30, 31, 22, 3, '1st Year', '2019-11-17 16:33:26', '2019-11-17 16:33:26', 2),
(31, 32, 22, 3, '4th Year', '2019-11-29 06:23:24', '2019-11-29 06:23:24', 2),
(35, 34, 22, 3, '4th Year edited', '2019-11-29 06:55:24', '2019-11-29 06:55:24', 2);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `year_level` text NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `strand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `academic_year_id`, `semester_id`, `student_id`, `year_level`, `curriculum_id`, `created_at`, `updated_at`, `last_updated_by`, `course_id`, `strand_id`) VALUES
(4, 6, 2, 155, '1st Year', 22, '2019-03-22 19:40:07', '2019-03-22 19:40:07', 2, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `graduates`
--

CREATE TABLE `graduates` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `year_graduated` year(4) NOT NULL,
  `special_order` text NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `strand_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `first_name` text NOT NULL,
  `middle_name` text DEFAULT NULL,
  `last_name` text NOT NULL,
  `birth_date` date NOT NULL,
  `gender` text NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact_no` varchar(11) NOT NULL,
  `address` text NOT NULL,
  `city` text DEFAULT NULL,
  `postal_code` varchar(10) NOT NULL,
  `province` text NOT NULL,
  `work_experience` text DEFAULT NULL,
  `certifications` text DEFAULT NULL,
  `educational_attainment` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `gender`, `email`, `contact_no`, `address`, `city`, `postal_code`, `province`, `work_experience`, `certifications`, `educational_attainment`, `user_id`, `active`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(63, 'IT19200004', 'Noel', 'Ricardo', 'Marcelino', '1982-02-23', 'Male', 'noel@yahoo.com', '09473308930', 'Sta. Monica', 'Subic', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:07:24', '2019-11-14 12:07:24', 2),
(64, 'IT19200005', 'Hasmin', NULL, 'Cuevas', '1982-02-23', 'Female', 'hasmin@yahoo.com', '09473308930', 'Calapacuan', 'Subic', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:08:41', '2019-11-14 12:08:41', 2),
(65, 'IT19200006', 'Glenn', NULL, 'Corpuz', '1982-02-23', 'Male', 'glenn@yahoo.com', '09473308930', 'Sta. Rita', 'Olongapo City', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:09:18', '2019-11-14 12:09:18', 2),
(66, 'IT19200007', 'Tracy', NULL, 'Santiago', '1982-02-23', 'Male', 'tracy@yahoo.com', '09473308930', 'Sta. Rita', 'Olongapo City', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:09:44', '2019-11-14 12:09:44', 2),
(67, 'IT19200008', 'Richard', NULL, 'Leong', '1982-02-23', 'Male', 'richard@yahoo.com', '09473308930', 'Sta. Rita', 'Olongapo City', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:10:14', '2019-11-14 12:10:14', 2),
(68, 'IT19200010', 'Darryl', NULL, 'Ramos', '1982-02-23', 'Male', 'darryl@yahoo.com', '09473308930', 'Sta. Rita', 'Olongapo City', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:10:41', '2019-11-14 12:10:41', 2),
(69, 'IT19200011', 'Evelyn', NULL, 'Sambili', '1982-02-23', 'Female', 'evz@yahoo.com', '09473308930', 'Sta. Rita', 'Olongapo City', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:11:20', '2019-11-14 12:11:20', 2),
(70, 'IT19200012', 'Arvee', NULL, 'Joy', '1982-02-23', 'Female', 'arvee@yahoo.com', '09473308930', 'Sta. Rita', 'Olongapo City', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:11:45', '2019-11-14 12:11:45', 2),
(71, 'IT19200013', 'Michelle', NULL, 'Flores', '1982-02-23', 'Female', 'mich@yahoo.com', '09473308930', 'Sta. Rita', 'Olongapo City', '2200', 'Zambales', NULL, NULL, 'BS in Information Technology', NULL, 1, '2019-11-14 12:12:06', '2019-11-14 12:12:06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_availabilities`
--

CREATE TABLE `instructor_availabilities` (
  `id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `day` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor_availabilities`
--

INSERT INTO `instructor_availabilities` (`id`, `instructor_id`, `academic_year_id`, `semester_id`, `time_start`, `time_end`, `day`, `active`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(11, 68, 6, 3, '08:00:00', '16:00:00', 'Monday', 1, '2019-11-17 17:44:52', '2019-11-17 17:44:52', 2),
(12, 68, 6, 3, '08:00:00', '16:00:00', 'Tuesday', 1, '2019-11-17 17:45:14', '2019-11-17 17:45:14', 2),
(13, 68, 6, 3, '08:00:00', '16:00:00', 'Wednesday', 1, '2019-11-17 17:45:30', '2019-11-17 17:45:30', 2),
(14, 68, 6, 3, '08:00:00', '16:00:00', 'Thursday', 1, '2019-11-17 17:45:37', '2019-11-17 17:45:37', 2),
(15, 68, 6, 3, '08:00:00', '16:00:00', 'Friday', 1, '2019-11-17 17:45:45', '2019-11-17 17:45:45', 2),
(16, 63, 6, 3, '08:00:00', '19:00:00', 'Monday', 1, '2019-11-17 17:46:23', '2019-11-17 17:46:23', 2),
(17, 63, 6, 3, '08:00:00', '19:00:00', 'Wednesday', 1, '2019-11-17 17:46:32', '2019-11-17 17:46:32', 2),
(18, 63, 6, 3, '08:00:00', '19:00:00', 'Friday', 1, '2019-11-17 17:46:39', '2019-11-17 17:46:39', 2),
(19, 63, 6, 3, '08:00:00', '20:30:00', 'Tuesday', 1, '2019-11-17 17:47:04', '2019-11-17 17:47:04', 2),
(20, 63, 6, 3, '08:00:00', '20:30:00', 'Thursday', 1, '2019-11-17 17:47:18', '2019-11-17 17:47:18', 2),
(21, 66, 6, 3, '08:00:00', '16:00:00', 'Monday', 1, '2019-11-17 17:51:36', '2019-11-17 17:51:36', 2),
(22, 66, 6, 3, '08:00:00', '16:00:00', 'Tuesday', 1, '2019-11-17 17:51:47', '2019-11-17 17:51:47', 2),
(23, 66, 6, 3, '08:00:00', '16:00:00', 'Wednesday', 1, '2019-11-17 17:51:53', '2019-11-17 17:51:53', 2),
(24, 66, 6, 3, '08:00:00', '16:00:00', 'Thursday', 1, '2019-11-17 17:52:00', '2019-11-17 17:52:00', 2),
(25, 66, 6, 3, '08:00:00', '16:00:00', 'Friday', 1, '2019-11-17 17:52:04', '2019-11-17 17:52:04', 2);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_preferred_subjects`
--

CREATE TABLE `instructor_preferred_subjects` (
  `id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor_preferred_subjects`
--

INSERT INTO `instructor_preferred_subjects` (`id`, `instructor_id`, `subject_id`, `academic_year_id`, `semester_id`, `active`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(4, 68, 20, 6, 3, 1, '2019-11-17 17:49:42', '2019-11-17 17:49:42', 2),
(5, 68, 21, 6, 3, 1, '2019-11-17 17:49:48', '2019-11-17 17:49:48', 2),
(6, 63, 22, 6, 3, 1, '2019-11-17 17:50:21', '2019-11-17 17:50:21', 2),
(7, 63, 23, 6, 3, 1, '2019-11-17 17:50:25', '2019-11-17 17:50:25', 2),
(8, 63, 24, 6, 3, 1, '2019-11-17 17:50:36', '2019-11-17 17:50:36', 2),
(9, 66, 25, 6, 3, 1, '2019-11-17 17:52:35', '2019-11-17 17:52:35', 2),
(10, 66, 32, 6, 3, 1, '2019-11-17 17:52:39', '2019-11-17 17:52:39', 2),
(11, 63, 31, 6, 3, 1, '2019-11-17 17:52:54', '2019-11-17 17:52:54', 2),
(12, 63, 30, 6, 3, 1, '2019-11-17 17:52:58', '2019-11-17 17:52:58', 2),
(13, 68, 26, 6, 3, 1, '2019-11-17 17:54:06', '2019-11-17 17:54:06', 2),
(14, 68, 27, 6, 3, 1, '2019-11-17 17:54:11', '2019-11-17 17:54:11', 2),
(15, 68, 28, 6, 3, 1, '2019-11-17 17:54:16', '2019-11-17 17:54:16', 2),
(16, 68, 29, 6, 3, 1, '2019-11-17 17:54:20', '2019-11-17 17:54:20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('02a51abdadbc5e8fcb52b2b783746c19487a89c8303d09e90ad80d36153297430e371ebe84c202aa', 2, 1, 'Comteq Registration System', '[]', 0, '2019-09-27 14:20:55', '2019-09-27 14:20:55', '2020-09-27 22:20:55'),
('0a1140d92622eed30d1dce7b696cda175530923173561bb6929778b6112dae7ff3485ddf249e1c66', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-07 04:24:45', '2019-10-07 04:24:45', '2020-10-07 12:24:45'),
('0d568563304f249a7bdcf8e5f0eaaa9acc0ec18a34800b11d92650ab5a6d7d400d0372e20780b897', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-07 04:24:45', '2019-10-07 04:24:45', '2020-10-07 12:24:45'),
('12198566ee3957f1bacbea6e32ad137058db0b196812672f9c9682491a4401069e10f71af0f512ae', 1, 1, 'Comteq Registration System', '[]', 0, '2019-03-15 17:49:08', '2019-03-15 17:49:08', '2020-03-16 01:49:08'),
('29ba1e944932cb841830acf261293378973fdf57afaf1c904ec1c6459d4858bfb15aea1d2690407f', 2, 1, 'Comteq Registration System', '[]', 0, '2019-11-08 01:26:15', '2019-11-08 01:26:15', '2020-11-08 09:26:15'),
('4b7e2bf1d1b6057cce732168a94608b2196fc29b3ec1c57f3a3a99143c4834c225a0aea91edf3eb3', 2, 1, 'Comteq Registration System', '[]', 0, '2019-09-27 14:20:55', '2019-09-27 14:20:55', '2020-09-27 22:20:55'),
('4be5e7ce724824d11197f7af6e9fe93fa9353eab9f7cb3caf5704cc7b3d460774cf0c915a97e3a79', 2, 1, 'Comteq Registration System', '[]', 0, '2019-09-16 06:48:59', '2019-09-16 06:48:59', '2020-09-16 14:48:59'),
('51a2f65e85fbb548806bc48f018c3b0546e633dec113b73fd996f7a4e7cb0d92b5ef4be4ecbdb06a', 2, 1, 'Comteq Registration System', '[]', 0, '2019-09-24 05:08:05', '2019-09-24 05:08:05', '2020-09-24 13:08:05'),
('744d077e7e1a38fc6757dcaf4ff93da0d59e2a029f419d1d4c786b90bc1334a1a51857e93dbc4eff', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-22 06:07:54', '2019-10-22 06:07:54', '2020-10-22 14:07:54'),
('775b17ce8737d7883c9d56532d4f52db2c914013aa4c6f83abd9eed7551e7c679cccef17089ee1c9', 1, 1, 'Comteq Registration System', '[]', 0, '2019-03-19 02:19:07', '2019-03-19 02:19:07', '2020-03-19 10:19:07'),
('8e1369b444378f37141318016643307655204c985fe624d8487b9c879881a45bc23270cbd4860132', 2, 1, 'Comteq Registration System', '[]', 0, '2019-11-05 08:47:19', '2019-11-05 08:47:19', '2020-11-05 16:47:19'),
('91c252955733c02201f8eeec55d3778deb614155030c6633b4665ebf8237a4d537c9d30826805e86', 2, 1, 'Comteq Registration System', '[]', 0, '2019-09-24 05:08:05', '2019-09-24 05:08:05', '2020-09-24 13:08:05'),
('98a9f816f79a27033471aee874da58e2eb9d5481448395d7f7b18dd2a24c554e8963395debcdd8d8', 1, 1, 'Comteq Registration System', '[]', 0, '2019-03-20 21:34:20', '2019-03-20 21:34:20', '2020-03-21 05:34:20'),
('b19cc6c1345b4af45b6d10b3da9b77e3370c5f3e9d30e4351acb599217e3de901409897f4ce0d026', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-07 07:37:55', '2019-10-07 07:37:55', '2020-10-07 15:37:55'),
('c4dc38ead6cd7e31037dcc022c7a450ff17ccd8f73dd36c9c9d8d3bf3e2c67cb73285e4effef7899', 2, 1, 'Comteq Registration System', '[]', 0, '2019-11-06 12:16:30', '2019-11-06 12:16:30', '2020-11-06 20:16:30'),
('c92b319f66db9af2a28bbc932089cd4b427f36ce7e3c1038c1e4257f49fda12391ff04dcb65269fc', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-22 06:07:54', '2019-10-22 06:07:54', '2020-10-22 14:07:54'),
('dd11954be4a7933ea60a9e52ee610cd2eeb44561ce6d39e9278828c05b3cbb1314f1b982775623c7', 1, 1, 'Comteq Registration System', '[]', 0, '2019-03-20 21:33:15', '2019-03-20 21:33:15', '2020-03-21 05:33:15'),
('e97e6537f5e97246d7f0026634cde3e0ec1c585d16ae7d4268195618cc3b8cb57f8f241b616e48d1', 2, 1, 'Comteq Registration System', '[]', 0, '2019-11-08 04:10:52', '2019-11-08 04:10:52', '2020-11-08 12:10:52'),
('ea9bb73bdc99288f217992aef42cd6d239b9377732182b1fb652ab15fb821c33146be6288aa7005e', 1, 1, 'Comteq Registration System', '[]', 0, '2019-03-20 21:33:29', '2019-03-20 21:33:29', '2020-03-21 05:33:29'),
('ecdd17d5e3dd1ffdefe76fc852739dff1ed281df60593189de87448f2a4bbda8c0b95d6600b40b3c', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-07 07:37:55', '2019-10-07 07:37:55', '2020-10-07 15:37:55'),
('f54b5c357aba278aa963eb16874638d183219ec0eac34a9a489e9473816f95680e2279dfcf0468e5', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-22 06:27:02', '2019-10-22 06:27:02', '2020-10-22 14:27:02'),
('f9c25b2f785cea0bb4b91a76d450a5a8cbd001f8b21c05c976e89b532ee10c80ae4152b43f9db6a9', 2, 1, 'Comteq Registration System', '[]', 0, '2019-10-22 06:27:02', '2019-10-22 06:27:02', '2020-10-22 14:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'cristine', 'QghJDeNYfKf5HFv7YZ4dYp8tLp2ZvqD3eOrCuSty', 'http://localhost', 1, 0, 0, '2019-03-15 17:48:57', '2019-03-15 17:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-03-15 17:48:57', '2019-03-15 17:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prerequisites`
--

CREATE TABLE `prerequisites` (
  `id` int(11) NOT NULL,
  `curriculum_subject_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pre_registrations`
--

CREATE TABLE `pre_registrations` (
  `id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `middle_name` text DEFAULT NULL,
  `last_name` text NOT NULL,
  `suffix_name` text DEFAULT NULL,
  `gender` text NOT NULL,
  `address` text NOT NULL,
  `civil_status` text NOT NULL,
  `city` text DEFAULT NULL,
  `postal` text NOT NULL,
  `province` text NOT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `cellphone` varchar(50) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `birth_date` date NOT NULL,
  `birth_place` text NOT NULL,
  `father_name` text DEFAULT NULL,
  `mother_name` text DEFAULT NULL,
  `contact_person` text NOT NULL,
  `contact_address` text NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `photo_url` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `academic_status` text NOT NULL,
  `student_status` text NOT NULL,
  `school_last_attended` text NOT NULL,
  `school_address` text NOT NULL,
  `last_track` text DEFAULT NULL,
  `last_strand` text DEFAULT NULL,
  `last_course` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL,
  `registration_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `room_name` text NOT NULL,
  `room_type` text NOT NULL,
  `room_capacity` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `room_name`, `room_type`, `room_capacity`, `active`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(28, 414, 'Robotics Room', 'Laboratory', 5, 1, '2019-11-14 11:56:02', '2019-11-14 11:56:02', 2),
(29, 415, 'Lecture Room I', 'Lecture', 20, 1, '2019-11-14 11:58:54', '2019-11-14 11:58:54', 2),
(31, 410, 'Lecture Room III', 'Lecture', 30, 1, '2019-11-14 11:59:35', '2019-11-14 11:59:35', 2),
(32, 409, 'Lecture Room IV', 'Lecture', 40, 1, '2019-11-14 11:59:50', '2019-11-14 11:59:50', 2),
(33, 408, 'Lecture Room V', 'Lecture', 40, 1, '2019-11-14 11:59:58', '2019-11-14 11:59:58', 2),
(34, 407, 'Lecture Room VI', 'Lecture', 30, 1, '2019-11-14 12:00:29', '2019-11-14 12:00:29', 2),
(35, 404, 'Lecture Room VII', 'Lecture', 40, 1, '2019-11-14 12:00:42', '2019-11-14 12:00:42', 2),
(36, 402, 'Lecture Room VIII', 'Lecture', 40, 1, '2019-11-14 12:00:53', '2019-11-14 12:00:53', 2),
(37, 401, 'Lecture Room IX', 'Lecture', 20, 1, '2019-11-14 12:01:15', '2019-11-14 12:01:15', 2),
(38, 403, 'Lecture Room X', 'Lecture', 40, 1, '2019-11-14 12:44:12', '2019-11-14 12:44:12', 2),
(39, 412, 'Lecture Room XI', 'Lecture', 30, 1, '2019-11-14 12:03:14', '2019-11-14 12:03:14', 2),
(40, 406, 'Computer Laboratory II', 'Computer Lab', 20, 1, '2019-11-14 12:04:17', '2019-11-14 12:04:17', 2),
(41, 405, 'Computer Laboratory I', 'Computer Lab', 20, 1, '2019-11-14 12:04:24', '2019-11-14 12:04:24', 2);

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `semester` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `semester`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(1, 'Summer', '2019-03-19 06:31:56', '2019-03-19 06:31:56', 1),
(2, '1st Semester', '2019-03-19 06:32:53', '2019-03-19 06:32:53', 1),
(3, '2nd Semester', '2019-03-19 06:32:59', '2019-03-19 06:32:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `current_academic_year` int(11) NOT NULL,
  `current_semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`current_academic_year`, `current_semester`) VALUES
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `strands`
--

CREATE TABLE `strands` (
  `id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `strand_code` text NOT NULL,
  `strand_desc` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `strands`
--

INSERT INTO `strands` (`id`, `track_id`, `strand_code`, `strand_desc`, `created_at`, `updated_at`, `last_updated_by`, `active`) VALUES
(8, 2, 'ICT', 'Information in Communication Technology', '2019-11-29 05:38:15', '2019-11-29 05:38:15', 2, 1),
(9, 2, 'HE', 'Edited', '2019-11-29 05:40:39', '2019-11-29 05:40:39', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_number` varchar(30) NOT NULL,
  `first_name` text NOT NULL,
  `middle_name` text DEFAULT NULL,
  `last_name` text NOT NULL,
  `suffix_name` text DEFAULT NULL,
  `gender` text NOT NULL,
  `address` text NOT NULL,
  `civil_status` text NOT NULL,
  `city` text DEFAULT NULL,
  `postal` text NOT NULL,
  `province` text NOT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `cellphone` varchar(50) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `birth_date` date NOT NULL,
  `birth_place` text NOT NULL,
  `father_name` text DEFAULT NULL,
  `mother_name` text DEFAULT NULL,
  `contact_person` text NOT NULL,
  `contact_address` text NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `photo_url` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `academic_status` text NOT NULL,
  `student_status` text NOT NULL,
  `school_last_attended` text NOT NULL,
  `school_address` text NOT NULL,
  `last_track` text DEFAULT NULL,
  `last_strand` text DEFAULT NULL,
  `last_course` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_number`, `first_name`, `middle_name`, `last_name`, `suffix_name`, `gender`, `address`, `civil_status`, `city`, `postal`, `province`, `telephone`, `cellphone`, `email`, `birth_date`, `birth_place`, `father_name`, `mother_name`, `contact_person`, `contact_address`, `contact_number`, `blood_type`, `photo_url`, `user_id`, `active`, `academic_status`, `student_status`, `school_last_attended`, `school_address`, `last_track`, `last_strand`, `last_course`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(155, '1920-02-0000', 'Renz Austin', NULL, 'Mariano', NULL, 'Male', '#99 Fendler St.', 'Single', NULL, '2200', 'Zambales', NULL, NULL, NULL, '1997-09-13', 'Olongapo City', NULL, NULL, 'Roger Mariano', '#99 Fendler St.', '09304616375', NULL, 'this is url', NULL, 1, 'Regular', 'Old', 'AICS', 'BPI Rotonda', NULL, NULL, NULL, '2020-01-05 16:56:10', '2020-01-05 16:56:10', 2),
(156, '1920-02-0001', 'John Christopher', NULL, 'Marty', NULL, 'Male', 'Pag Asa', 'Single', NULL, '2200', 'Zambales', NULL, NULL, NULL, '1998-04-09', 'Olongapo City', NULL, NULL, 'Jesus Marty', 'Pag-asa', '09304616375', NULL, 'this is url', NULL, 1, 'Regular', 'Old', 'AICS', 'BPI Rotonda', NULL, NULL, NULL, '2020-01-05 17:18:26', '2020-01-05 17:18:26', 2),
(157, '1819-01-7019', 'Cristine', NULL, 'Apid', NULL, 'Male', 'Pag Asa', 'Single', NULL, '2200', 'Zambales', NULL, NULL, NULL, '1998-04-09', 'Olongapo City', NULL, NULL, 'Jesus Marty', 'Pag-asa', '09304616375', NULL, 'this is url', NULL, 1, 'Regular', 'Old', 'AICS', 'BPI Rotonda', NULL, NULL, NULL, '2020-01-05 17:37:31', '2020-01-05 17:37:31', 2),
(159, '1920-02-0002', 'Melvid Louise', NULL, 'Bronil', NULL, 'Male', 'Pag Asa', 'Single', NULL, '2200', 'Zambales', NULL, NULL, NULL, '1998-04-09', 'Olongapo City', NULL, NULL, 'Jesus Marty', 'Pag-asa', '09304616375', NULL, 'this is url', NULL, 1, 'Regular', 'New', 'AICS', 'BPI Rotonda', NULL, NULL, NULL, '2020-01-05 17:39:27', '2020-01-05 17:39:27', 2),
(160, '1920-02-7020', 'Joel', NULL, 'Saquido', NULL, 'Male', 'Pag Asa', 'Single', NULL, '2200', 'Zambales', NULL, NULL, NULL, '1998-04-09', 'Olongapo City', NULL, NULL, 'Jesus Marty', 'Pag-asa', '09304616375', NULL, 'this is url', NULL, 1, 'Regular', 'New', 'AICS', 'BPI Rotonda', NULL, NULL, NULL, '2020-01-18 13:37:11', '2020-01-18 13:37:11', 2),
(161, '1920-02-7021', 'Adrian Paul', NULL, 'Magsino', NULL, 'Male', 'Pag Asa', 'Single', NULL, '2200', 'Zambales', NULL, NULL, NULL, '1998-04-09', 'Olongapo City', NULL, NULL, 'Jesus Marty', 'Pag-asa', '09304616375', NULL, 'this is url', NULL, 1, 'Regular', 'New', 'AICS', 'BPI Rotonda', NULL, NULL, NULL, '2020-01-18 13:37:48', '2020-01-18 13:37:48', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_requirements`
--

CREATE TABLE `student_requirements` (
  `id` int(11) NOT NULL,
  `url_tor` text DEFAULT NULL,
  `url_good_moral` text DEFAULT NULL,
  `url_form_137` text DEFAULT NULL,
  `url_form_138` text DEFAULT NULL,
  `url_birth_certificate` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL,
  `student_number` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_requirements`
--

INSERT INTO `student_requirements` (`id`, `url_tor`, `url_good_moral`, `url_form_137`, `url_form_138`, `url_birth_certificate`, `created_at`, `updated_at`, `last_updated_by`, `student_number`) VALUES
(161, '1920-02-7021_tor.png', '1920-02-7021_good_moral.jpg', '1920-02-7021_form_137.png', '1920-02-7021_form_138.png', '1920-02-7021_birth_certificate.jpg', '2020-01-23 16:19:43', '2020-01-23 16:19:43', 2, '1920-02-7021');

-- --------------------------------------------------------

--
-- Table structure for table `student_schedules`
--

CREATE TABLE `student_schedules` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `prelim_grade` float DEFAULT NULL,
  `midterm_grade` float DEFAULT NULL,
  `prefinal_grade` float DEFAULT NULL,
  `final_grade` float DEFAULT NULL,
  `semestral` float DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `figure` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_schedules`
--

INSERT INTO `student_schedules` (`id`, `enrollment_id`, `schedule_id`, `prelim_grade`, `midterm_grade`, `prefinal_grade`, `final_grade`, `semestral`, `remarks`, `figure`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(2, 4, 11, 92, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-14 00:41:28', '2020-01-14 00:41:28', 2);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `subject_description` text NOT NULL,
  `units` int(11) NOT NULL,
  `lec` int(11) NOT NULL,
  `lab` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_code`, `subject_description`, `units`, `lec`, `lab`, `active`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(20, 'GE101', 'Understanding the self', 3, 3, 0, 1, '2019-11-14 12:25:46', '2019-11-14 12:25:46', 2),
(21, 'GE102', 'Reading the Philippine History', 3, 3, 0, 1, '2019-11-14 12:26:13', '2019-11-14 12:26:13', 2),
(22, 'CC101', 'Introduction to Computing', 3, 2, 1, 1, '2019-11-14 12:26:47', '2019-11-14 12:26:47', 2),
(23, 'CC102', 'Computer Programming 1 (Fundamentals of Programming)', 3, 2, 1, 1, '2019-11-14 12:27:14', '2019-11-14 12:27:14', 2),
(24, 'CC103', 'Data Structure and Algorithms', 3, 2, 1, 1, '2019-11-14 12:28:21', '2019-11-14 12:28:21', 2),
(25, 'PE1', 'Self-Testing Activities / Gymnastics', 3, 2, 0, 1, '2019-11-14 12:28:53', '2019-11-14 12:28:53', 2),
(26, 'GE103', 'The Contemporary World', 3, 3, 0, 1, '2019-11-17 16:17:54', '2019-11-17 16:17:54', 2),
(27, 'GE104', 'Mathematics in the Modern World', 3, 3, 0, 1, '2019-11-17 16:18:34', '2019-11-17 16:18:34', 2),
(28, 'GE105', 'Purposive Communication', 3, 3, 0, 1, '2019-11-17 16:18:53', '2019-11-17 16:18:53', 2),
(29, 'GE106', 'Art Appreciation', 3, 3, 0, 1, '2019-11-17 16:19:05', '2019-11-17 16:19:05', 2),
(30, 'CC104', 'Computer Programming 2 (Intermediate Programming)', 3, 2, 1, 1, '2019-11-17 16:20:14', '2019-11-17 16:20:14', 2),
(31, 'HCI101', 'Human Computer Interaction', 3, 2, 1, 1, '2019-11-17 16:20:49', '2019-11-17 16:20:49', 2),
(32, 'PE2', 'Rhythmic Activities', 2, 2, 0, 1, '2019-11-17 16:21:19', '2019-11-17 16:21:19', 2),
(33, 'PS101', 'Physical Science', 3, 3, 0, 1, '2019-11-26 02:12:00', '2019-11-26 02:12:00', 2),
(34, 'ENT101', 'Entreprenuership', 3, 3, 0, 1, '2019-11-26 02:12:16', '2019-11-26 02:12:16', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `id` int(11) NOT NULL,
  `track_code` text NOT NULL,
  `track_desc` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`id`, `track_code`, `track_desc`, `active`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(1, 'Academic', '', 0, '2019-11-29 05:14:18', '2019-11-29 05:15:44', NULL),
(2, 'Technical-Vocational-Livelihood (TVL)', 'Edited Track', 0, '2019-11-29 05:25:10', '2019-11-29 05:25:10', 2),
(3, 'Sample', 'Desc', 1, '2019-11-29 05:17:29', '2019-11-29 05:17:29', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `remember_token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `email_verified_at`, `first_name`, `middle_name`, `last_name`, `role`, `remember_token`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(1, 'slave', '5cb876c992590d85d65ca2a9196a911c', 'austindmariano@gmail.com', NULL, 'Renz Austin', NULL, 'Mariano', 'System Administrator', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY1NGI1YzM1N2FiYTI3OGFhOTYzZWIxNjg3NDYzOGQxODMyMTllYzBl', '2019-03-15 17:44:46', '2019-03-15 17:44:46', 1),
(2, 'admin', '0d107d09f5bbe40cade3de5c71e9e9b7', 'mshasmin@gmail.com', NULL, 'Hasmin', 'Dela Cruz', 'Cuevas', 'System Administrator', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY1NGI1YzM1N2FiYTI3OGFhOTYzZWIxNjg3NDYzOGQxODMyMTllYzBl', '2019-09-16 06:45:56', '2019-12-05 10:14:52', 2),
(3, 'austin', '$2y$10$LWsUCtjSGiFU4cbkYaxn0O0xfoxGlznE3xfF2QSxXR38/pHaoqJoK', 'sample@gmail.com', NULL, 'Austin', 'Delos Reyes', 'Mariano', 'System Administrator', NULL, '2019-11-11 06:48:23', '2019-11-11 06:48:23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `last_updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_activities`
--

INSERT INTO `user_activities` (`id`, `title`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(1, 'User Management', '2019-09-16 06:32:07', '2019-09-16 06:32:07', 0),
(2, 'Registration', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(3, 'Enrollment', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(4, 'Academic Year Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(5, 'Semester Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(6, 'Room Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(7, 'Instructor Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(8, 'Course Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(9, 'Subject Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(10, 'Curriculum Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(11, 'Schedule Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(12, 'Activity Log', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(13, 'Assessment Management', '2019-09-16 06:34:14', '2019-09-16 06:34:14', 0),
(14, 'Strand Management', '2019-11-06 09:57:23', '2019-11-06 09:57:23', 0),
(15, 'Track Management', '2019-11-06 09:57:23', '2019-11-06 09:57:23', 0),
(16, 'Student Management', '2020-01-05 15:25:30', '2020-01-05 15:25:30', 0),
(17, 'Enrollment Management', '2020-01-05 15:25:30', '2020-01-05 15:25:30', 0),
(18, 'Requirements Management', '2020-01-05 15:26:18', '2020-01-05 15:26:18', 0),
(19, 'Student Schedule Management', '2020-01-05 15:26:18', '2020-01-05 15:26:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `create_priv` smallint(6) DEFAULT NULL,
  `read_priv` smallint(6) DEFAULT NULL,
  `update_priv` smallint(6) DEFAULT NULL,
  `delete_priv` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `last_updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_privileges`
--

INSERT INTO `user_privileges` (`id`, `user_id`, `activity_id`, `create_priv`, `read_priv`, `update_priv`, `delete_priv`, `created_at`, `updated_at`, `last_updated_by`) VALUES
(40, 2, 1, 1, 1, 1, 1, '2019-09-16 06:46:19', '2019-09-16 06:46:19', NULL),
(41, 2, 2, 1, 1, 1, 1, '2019-09-16 06:46:19', '2019-09-16 06:46:19', NULL),
(42, 2, 3, 1, 1, 1, 1, '2019-09-16 06:46:19', '2019-09-16 06:46:19', NULL),
(43, 2, 4, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(44, 2, 5, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(45, 2, 6, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(46, 2, 7, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(47, 2, 8, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(48, 2, 9, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(49, 2, 10, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(50, 2, 11, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(51, 2, 12, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(52, 2, 13, 1, 1, 1, 1, '2019-09-16 06:46:20', '2019-09-16 06:46:20', NULL),
(53, 2, 14, 1, 1, 1, 1, '2019-11-06 09:57:44', '2019-11-06 09:57:44', NULL),
(54, 2, 15, 1, 1, 1, 1, '2019-11-06 09:57:44', '2019-11-06 09:57:44', NULL),
(55, 2, 16, 1, 1, 1, 1, '2020-01-05 15:27:38', '2020-01-05 15:27:38', NULL),
(56, 2, 17, 1, 1, 1, 1, '2020-01-05 15:27:51', '2020-01-05 15:27:51', NULL),
(57, 2, 18, 1, 1, 1, 1, '2020-01-05 15:28:04', '2020-01-05 15:28:04', NULL),
(58, 2, 19, 1, 1, 1, 1, '2020-01-05 15:28:04', '2020-01-05 15:28:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year_UNIQUE` (`academic_year`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_activity_logs_users1_idx` (`user_id`);

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Assesment_Enrollment1_idx` (`enrollment_id`);

--
-- Indexes for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ClassSchedule_Room1_idx` (`room_id`),
  ADD KEY `fk_ClassSchedule_Instructor1_idx` (`instructor_id`),
  ADD KEY `fk_academic_yead_id_idx` (`academic_year_id`),
  ADD KEY `fk_semester_id_idx` (`semester_id`),
  ADD KEY `grcvxvx` (`subject_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courseCode_UNIQUE` (`course_code`);

--
-- Indexes for table `curriculums`
--
ALTER TABLE `curriculums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Curriculum_Course_idx` (`course_id`),
  ADD KEY `fk_strand_id_idx` (`strand_id`);

--
-- Indexes for table `curriculum_subjects`
--
ALTER TABLE `curriculum_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_CurriculumSubject_Subject1_idx` (`subject_id`),
  ADD KEY `fk_CurriculumSubject_Curriculum1_idx` (`curriculum_id`),
  ADD KEY `fk_semester_idx` (`semester_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Enrollment_Curriculum1_idx` (`curriculum_id`),
  ADD KEY `fk_Enrollment_Student1_idx` (`student_id`),
  ADD KEY `fk_enrollments_semesters1_idx` (`semester_id`),
  ADD KEY `fk_enrollments_courses1_idx` (`course_id`),
  ADD KEY `academic_year_idx` (`academic_year_id`),
  ADD KEY `strands_idx` (`strand_id`);

--
-- Indexes for table `graduates`
--
ALTER TABLE `graduates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_graduatestudent_student1_idx` (`student_id`),
  ADD KEY `fk_courses_idx` (`course_id`),
  ADD KEY `fk_strands_idx` (`strand_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EmployeeID_UNIQUE` (`employee_id`),
  ADD KEY `fk_Instructor_UserAccount1_idx` (`user_id`);

--
-- Indexes for table `instructor_availabilities`
--
ALTER TABLE `instructor_availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_InstructorAvailability_Instructor1_idx` (`instructor_id`),
  ADD KEY `academic_years_idx` (`academic_year_id`),
  ADD KEY `semesters_idx` (`semester_id`);

--
-- Indexes for table `instructor_preferred_subjects`
--
ALTER TABLE `instructor_preferred_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_InstructorPrefferedSubject_Subject1_idx` (`subject_id`),
  ADD KEY `fk_InstructorPrefferedSubject_Instructor1_idx` (`instructor_id`),
  ADD KEY `fk_instructor_preferred_subject_semesters1_idx` (`semester_id`),
  ADD KEY `fk_instructor_preferred_subject_academic_years1_idx` (`academic_year_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1_prereq_idx` (`curriculum_subject_id`),
  ADD KEY `fk2_prereq_idx` (`subject_id`);

--
-- Indexes for table `pre_registrations`
--
ALTER TABLE `pre_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`current_academic_year`,`current_semester`),
  ADD KEY `fk_academic years_idx` (`current_academic_year`),
  ADD KEY `fk_semesters_idx` (`current_semester`);

--
-- Indexes for table `strands`
--
ALTER TABLE `strands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_track_id_idx` (`track_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `studentNumber_UNIQUE` (`student_number`),
  ADD KEY `student_account_idx` (`user_id`),
  ADD KEY `student_user_id_idx` (`user_id`);

--
-- Indexes for table `student_requirements`
--
ALTER TABLE `student_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_StudentRequirements_Student1_idx` (`id`),
  ADD KEY `fj` (`student_number`);

--
-- Indexes for table `student_schedules`
--
ALTER TABLE `student_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_StudentSchedule_Enrollment1_idx` (`enrollment_id`),
  ADD KEY `fk` (`schedule_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_code_UNIQUE` (`subject_code`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_UserPriviledge_UserAccount1_idx` (`user_id`),
  ADD KEY `fk_UserPriviledge_UserActivity1_idx` (`activity_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4612;

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `curriculums`
--
ALTER TABLE `curriculums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `curriculum_subjects`
--
ALTER TABLE `curriculum_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `graduates`
--
ALTER TABLE `graduates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `instructor_availabilities`
--
ALTER TABLE `instructor_availabilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `instructor_preferred_subjects`
--
ALTER TABLE `instructor_preferred_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prerequisites`
--
ALTER TABLE `prerequisites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_registrations`
--
ALTER TABLE `pre_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `strands`
--
ALTER TABLE `strands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `student_schedules`
--
ALTER TABLE `student_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `fk_activity_logs_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `fk_Assesment_Enrollment1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `fk_academic_yead_id` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_schedules_instructors1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_schedules_rooms1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semester_id` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `grcvxvx` FOREIGN KEY (`subject_id`) REFERENCES `curriculum_subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `curriculums`
--
ALTER TABLE `curriculums`
  ADD CONSTRAINT `fk_curriculums_courses1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_strand_id` FOREIGN KEY (`strand_id`) REFERENCES `strands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `curriculum_subjects`
--
ALTER TABLE `curriculum_subjects`
  ADD CONSTRAINT `fk_curriculum_subjects_curriculums1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curriculum_subjects_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `academic_year` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enrollments_curriculums1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enrollments_semesters1` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enrollments_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `strands` FOREIGN KEY (`strand_id`) REFERENCES `strands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `graduates`
--
ALTER TABLE `graduates`
  ADD CONSTRAINT `fk_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_graduates_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_strands` FOREIGN KEY (`strand_id`) REFERENCES `strands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `instructor_availabilities`
--
ALTER TABLE `instructor_availabilities`
  ADD CONSTRAINT `academic_years` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_instructor_availabilities_instructors1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `semesters` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `instructor_preferred_subjects`
--
ALTER TABLE `instructor_preferred_subjects`
  ADD CONSTRAINT `fk_instructor_preferred_subject_academic_years1` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_instructor_preferred_subject_instructors1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_instructor_preferred_subject_semesters1` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD CONSTRAINT `fk1_prereq` FOREIGN KEY (`curriculum_subject_id`) REFERENCES `curriculum_subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk2_prereq` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `fk_academic years` FOREIGN KEY (`current_academic_year`) REFERENCES `academic_years` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_semesters` FOREIGN KEY (`current_semester`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `strands`
--
ALTER TABLE `strands`
  ADD CONSTRAINT `fk_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_requirements`
--
ALTER TABLE `student_requirements`
  ADD CONSTRAINT `fj` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_schedules`
--
ALTER TABLE `student_schedules`
  ADD CONSTRAINT `fk` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedules` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_schedules_enrollments1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD CONSTRAINT `fk_user_privileges_user_activities1` FOREIGN KEY (`activity_id`) REFERENCES `user_activities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
