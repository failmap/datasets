-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Gegenereerd op: 22 apr 2016 om 17:39
-- Serverversie: 5.5.47-0+deb8u1
-- PHP-versie: 7.0.4-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faalkaart`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `coordinate`
--

CREATE TABLE `coordinate` (
  `id` int(11) NOT NULL,
  `organization` varchar(50) NOT NULL,
  `area` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `organization`
--

CREATE TABLE `organization` (
  `country` varchar(255) NOT NULL,
  `type` varchar(40) NOT NULL,
  `name` varchar(50) NOT NULL,
  `twitter` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `scans_dnssec`
--

CREATE TABLE `scans_dnssec` (
  `id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  `has_dnssec` tinyint(1) NOT NULL,
  `scanmoment` datetime NOT NULL,
  `rawoutput` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `scans_ssllabs`
--

CREATE TABLE `scans_ssllabs` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `servernaam` varchar(255) NOT NULL,
  `ipadres` varchar(255) NOT NULL,
  `poort` int(6) NOT NULL,
  `scandate` date NOT NULL,
  `scantime` time NOT NULL,
  `scanmoment` datetime NOT NULL,
  `rating` varchar(3) NOT NULL,
  `ratingNoTrust` varchar(3) NOT NULL,
  `rawData` text NOT NULL,
  `isDead` tinyint(1) NOT NULL,
  `isDeadSince` datetime NOT NULL,
  `isDeadReason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `url`
--

CREATE TABLE `url` (
  `organization` varchar(50) NOT NULL,
  `url` varchar(150) NOT NULL,
  `isDead` tinyint(1) NOT NULL DEFAULT '0',
  `isDeadSince` datetime NOT NULL,
  `isDeadReason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `coordinate`
--
ALTER TABLE `coordinate`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`name`);

--
-- Indexen voor tabel `scans_dnssec`
--
ALTER TABLE `scans_dnssec`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `scans_ssllabs`
--
ALTER TABLE `scans_ssllabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scantijd` (`scantime`),
  ADD KEY `scandate` (`scandate`),
  ADD KEY `url` (`url`);

--
-- Indexen voor tabel `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`organization`,`url`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `coordinate`
--
ALTER TABLE `coordinate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;
--
-- AUTO_INCREMENT voor een tabel `scans_ssllabs`
--
ALTER TABLE `scans_ssllabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33814;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
