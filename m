Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887F1267B92
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213494; cv=none; b=NDyDfknkilcXz+f+88ASJeW2qjUu96iTPtxbn9PmThWWh0XZUzBJVntGgruYaWRjxwXbEXdrSIC4j21qcGPAjSXDzyEssb+zICG+hX3ZIAJn267kJWSUDYmNLS7m/mnQXeXrNERWIMIFlNBxIQYzVQgp1Bjhp/AA7JXJ4EO1O9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213494; c=relaxed/simple;
	bh=gQX1tPtoBeVaDkfhW31RPjLez11EkdHuSuhYTxeIN6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cRS7KyZrYBylwKZIpm0J3dCznwxXMmLZ7xCX6OPO62kior/gujB7xDTUrVyQMLSf+PWnb8QfZAL5Tpw4nW55bzOiP9h0lqoKMjAT+2+RRwRo8DSnFhOzu3MJBGtILgTP1P6kTxSwY1JTt9Gz7hiq+6QkHb7tCKmTqXNOTPvzw4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLgn5L0b; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLgn5L0b"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-afc857702d1so4243001a12.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213493; x=1744818293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v49ZwnZIj2AOJhsRco4puem3oLXi78jqbt8BbW57LpM=;
        b=QLgn5L0blLSF/tv6vE1W3ZzPc9E6pLW3OaYntFW+COHMKIe3uZjDM3JpzeZ4IE6E8I
         vKIkOthYuUTBAkUxcqcsR/Rj6oOa6BAruTgR5u/7gGVfsTUtQkogmjJmSD49ijuR7Yv+
         +lJsIrfsl7vGeVtMN8Ss1f9NmoDwoYJgXr7aTSxgxUkodzVVraC0mU5DkjmyqfwkmTW+
         tQgqnpClL6AL81hDGcLeRj3LJEV8Ulm+FgvgEfmyiaZPARZoXBfd6Ukibgm2bS5qJr/l
         tt3ozENY6QjcX/0QxwaEoSuqsOkYOLVM8yxaLhQE3+aj3SbcZav/Rp9Ase+XIYjpFOY+
         e+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213493; x=1744818293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v49ZwnZIj2AOJhsRco4puem3oLXi78jqbt8BbW57LpM=;
        b=kLMuKEX0soO1/Gf296EaUz/v0ttq5Oe3R0MgfR6Hbtf998S+MsEGoBBUl2jkLIb15m
         NnJMtA/YmOT9JvLnOgKqPr3vvZ+ePRRcVrdD5U0J9qYldGDSraYCdcVZceTQKiwQiw2u
         1YM5TvOsEUHmkM4YmOzczhkROPdpv3ZdPOjdXtoZrbVpDpocRQagNq7TiKy2lzFuSu1r
         ksxy+JUe2nqmMLquyoeX/LLgXpVbg7kQBf13nPrmaFtgd2FUOTP481C6MDNpVGQgJoWv
         Vq15KkDczdiwW/Yzv+kQz56bB7eRd1NBNd2Npgolvpux4vTLdErEg1oDrACu+wgCKLcj
         NfKw==
X-Forwarded-Encrypted: i=1; AJvYcCVUAJ5YWalbfe6Z5SflURDiDi+3IVBBMKLi75FiyNw54H0x9tLJkP4JZHPXuwemx269mRZcWoJbCZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzORwJwdS1DBp+KI2/eXm3QOVqjtf/esGIVmf9uUIKDEok6aWFA
	d2EV6/jmE9HstyRcQEXTXC+0en6UmrI0NtU5nhhvsTY8/wZj1jRn
X-Gm-Gg: ASbGnctLMz05TtfDVyBWnd8WA5DV4fdfTFv38KpDA45puXfgqzT7t52UopXWuCTomGN
	gzDsG6Lh+PnlGMGr07v+WO75e5/ta/E2lA75TyHFmdTn17hudFtLkRLXNa20SqXo5rQTSnjqWfm
	9ijlorKx/ml83HMZNRjMsqlKSoSSeOO/5m2Ld0w3nC3JS/0yTfLdl3MJ3wy5BMvU4azQV98JDIG
	CicrScRnfqix0nMAAZhEevQmz92niw2o9iwDQUunlLTcXhCnAWOPm0D54/dSYglcCW58VI2FJ3H
	wEYiEPeMALSg94YWbBHG0xlNxSmC5kAhCeNwLYApGEy0YecNAUbB6VNwonGPcCvXrpeJiwid46K
	nlgZu1w==
X-Google-Smtp-Source: AGHT+IHDjC6NZDKGKeJbiK4hibwKJCoZJOXppnGBHSYZ9kKUia5ispG3D8M0PIfVIJ8M4eMwylwt9g==
X-Received: by 2002:a17:90b:1f8f:b0:305:2d28:c8fd with SMTP id 98e67ed59e1d1-306dbc2bf43mr5380309a91.24.1744213492550;
        Wed, 09 Apr 2025 08:44:52 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:44:52 -0700 (PDT)
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
Subject: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:45 +0800
Message-Id: <20250409154356.423512-3-visitorckw@gmail.com>
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
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..5e1b7b1742e4 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity_odd(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1

