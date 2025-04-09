Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E822C269B1E
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213568; cv=none; b=ME95G2PTtYllY0KWtWEvD/i1dmG4OAWy5T4QS0Z8Nl/FKNCkN0GZfNb2VdKUqs/wvm+lp3JCp7Wkyyrwa97VqypMe97S3TgM66/J7vhKsN8nBMd0r1wEX39B1I5YGCvznDSkpRrTxVbXGisxntXWgjm+E0ti4AzyIE2qVuxM4Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213568; c=relaxed/simple;
	bh=D6aTyRfVYrEdl/DsEoiOfCh6E66jdqjJl29yHOL9VgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UdrU3JUuEx+jHe+Xh3Y4sxvWTPbEFPAvyFSQBInkWUJE6O3x/tmthAhFTEUzvYYs4cLJWKavAMKCf1zZMKUw17mZ/0BnLAGKA5FOusUVYE43a4LUpQGzRvHcKPZCx5CYZAvN8u7WP9VWku03KMxErGW4+njeOkJWq6lX8xMth2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8MQmwwd; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8MQmwwd"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3011737dda0so5300658a91.1
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213566; x=1744818366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXLi2SRJHleL6i4thZNOgy64MnVVDpLvymelzP4O5VU=;
        b=T8MQmwwd25jtQKDrVhKPmuoPUeYnEaMJK1Irz6Aj8YfQkblycN+opjEAkQkAWm+sFe
         +qGyMOoUQ3TVj7ZRLfgJbPgVthJGR1bfTjPXJKcNf3KqaLU1hde3YLMayMBBdGQxSpgt
         ZTKp4i2Cfn1JJAlJP8c97c6wWd4p1D1SEE7Yz4r9utJKPuv/Nkset7CDVkGx43l2K2ep
         crYS6kwmVX9bzln8UX0yDlA0sG5lHpvTUcyGPKorDUhifdmGMl/eZR2lySpgbzsqpmE1
         EPXr7lUu5rz+ufqXX4ryTbgHnCtHvk+0SflH8la+BBOemB1ST1imtFtSCgVxEbfQ/Xi0
         oP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213566; x=1744818366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXLi2SRJHleL6i4thZNOgy64MnVVDpLvymelzP4O5VU=;
        b=lCGq1QnR6JO8iNtFjxaPfixyl7TXVszjkRmAYm6Es6AKtbZHC+ifc2fZ6PfvSbFpQo
         Byali/3SS4bOLt7saC+h4QHd9MZ5/oiRjD1YdTqaTCFDpU3qnBIeuSYh2FdC7M+JrbTU
         SyzdqssFycufT2Ocj4XjSxkkH+YxvkzM48OdeixgBvvB1IAoG6BnfzVCy3AC+inZaOm+
         3e7TmUUmIj3ky9DPpnAeBkUQPjVzdRKlZwrTl7DYO40xOQCaZJD2ICgJJ03Dm8QADArK
         yISdVungdElwROhm4Tjpn0RUavv3aLQEnOX6HENNXuX3fFC6l2KTnRUtBHQV0YBKNHGh
         0I5w==
X-Forwarded-Encrypted: i=1; AJvYcCVVWjiBZojddT4AsE2h4suZDHMt5xGyvjt6cbY/BbB0RH67zEMLLyW4/bIhvJmdPGNLFQP+ShS1has=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVzKsM9owwr7ulBbzub+sDjdmCE6nm+02pZql2UQ6BFKHe4VDH
	giKbv57Utqi2189e3cg2HEpNRP8DpbpGMgy+U0dWJY55VpfSpIcm
X-Gm-Gg: ASbGncv/DxllWstOilLVzS0e7LmU2fIwegQ97wBubuKUBbBhGjRAb9zrglA+tuW7PGn
	/npkCIPqeLheHGFhNbK78WXgj0EB/nzhYMTbEaXY1wMZAEAHeHE6JCpEmBl2Z3FPkiuZO7Zq8wc
	RAdiXSlPuR/BnCfIGM+HqyzL/FoDsflz8ysSjNzxwLfK5rQdwJ9q2ZBEUAAFrTCgQd28Kaymom2
	NRyV4XVAaxUhS599avetChrDSOI9CHpFYqtyq7/R+EpT21BWM51YqioNtEw4VagTkJkYuUUSsTy
	uA4V5EsBt78NqD0btBr4UIk2+KGczpcLmDpp1v9jTG4DPZEtW5k1Dyxr8CbvcnIJpjO/o5o=
X-Google-Smtp-Source: AGHT+IGweN+KZRMZ3CYcrqcq5iC29qaxOJUe/Q8yFuoByE0YY1D6tXNucvOC/QvWbivmYcNL8OhrUw==
X-Received: by 2002:a17:90b:584b:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-306dd52eaadmr4119633a91.20.1744213565972;
        Wed, 09 Apr 2025 08:46:05 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:05 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 08/13] net: ethernet: oa_tc6: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:51 +0800
Message-Id: <20250409154356.423512-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/net/ethernet/oa_tc6.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index db200e4ec284..6734b49357e7 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/iopoll.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
@@ -177,19 +178,6 @@ static int oa_tc6_spi_transfer(struct oa_tc6 *tc6,
 	return spi_sync(tc6->spi, &msg);
 }
 
-static int oa_tc6_get_parity(u32 p)
-{
-	/* Public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	p ^= p >> 1;
-	p ^= p >> 2;
-	p = (p & 0x11111111U) * 0x11111111U;
-
-	/* Odd parity is used here */
-	return !((p >> 28) & 1);
-}
-
 static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 					 enum oa_tc6_register_op reg_op)
 {
@@ -202,7 +190,7 @@ static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_ADDR, addr) |
 		 FIELD_PREP(OA_TC6_CTRL_HEADER_LENGTH, length - 1);
 	header |= FIELD_PREP(OA_TC6_CTRL_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+			     !parity_odd(header));
 
 	return cpu_to_be32(header);
 }
@@ -940,8 +928,7 @@ static __be32 oa_tc6_prepare_data_header(bool data_valid, bool start_valid,
 		     FIELD_PREP(OA_TC6_DATA_HEADER_END_BYTE_OFFSET,
 				end_byte_offset);
 
-	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY,
-			     oa_tc6_get_parity(header));
+	header |= FIELD_PREP(OA_TC6_DATA_HEADER_PARITY, !parity_odd(header));
 
 	return cpu_to_be32(header);
 }
-- 
2.34.1

