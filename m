Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66713A3EC
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329062; cv=none; b=AAt4/0ztptgc2bFg+Q457p78FKGX7IUg2JTCwW19DO4UPJrZm7gUwPuUIl+qRdJU7pkd9rBwkLFUncYzmsa7tXR/CPCllvXo6X1+2wcTu30gvMuasiq7OrTUa2kuQ0pA36XipAdKrBq1ONTECkNaNpsx9sjTLKxBBKFGKsCMpaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329062; c=relaxed/simple;
	bh=HKAn3f+7sbHTTp+UNFXBUa/TbF/WrljtWVRMW4BZHbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRbqHnwuOIcGdv3eDxVkIEghVcdNvjWUgNbLxENhnX/Bki0vqDPEkaArns9MrHRUHk9CIlLd7OBFKpAy8JoSHyywXevEZ83pTu8nNawvB7M3sybLPFS6D2dMKvbRRop+N+vinCHrt9Bhe7UtFt0ChC2f0LfOIdYMghaLOPg2LiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fr5Gkpcn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fr5Gkpcn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fce3b01efcso4287803a91.3
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329060; x=1740933860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=Fr5Gkpcnt0zzUb9hvsdntbH/s2z+ejKkBU1Akt9ilLNUakCtYs59txAUjU2IIhe4pL
         mysR2YaVWLx2zwBP8kOWnJme4UnoGeGpQ/f0HtO1LT4wMXnhDolNzdEU2QFJKrjtfWOD
         hhohl4CN04sv/oy9a8QIv/3QfOdinbTVvN/bjnpvA2yWg7kTEsBR3b8wcZSBKQXLCAEv
         aj5FdGHZ4d+a3P2CQtCnn/db8UEsZrszAJMIkELbIqp8dEGSdeOBJMCmMDCP9OKuZh+i
         MvCBOTYrbKa4SXP1kHajLA/vAcwPL6xMjuFHiWuYHMZN4TOM/esqmGK3JzWrAfN6+Q+X
         L8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329060; x=1740933860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcXJ496C/2+0qa2GsfTbiscKGioWO59ZW48/kJd6oSs=;
        b=uLVLDCjgfNDh97rhb7eVbldF47G75Ebtk/7mRatH2wpfSxGdRMqlNDtXsftmBDrqz/
         9JGTd44PB2ymdRgIwE6fLOuWtqSz+laazeJm3RFNc6+KprL89dtM+I/xKGhEg8Xd/PuY
         gE+wlxv3gUF/JZgLFFexNmNsbplaEqzzH4vKW/OxWjvltWgC+hSwp1dE3ZKSAuRhxzOw
         ZNiA2JJ4tjddzaTqdZh3bn5A3fU8YY2yBdKjlEoOuWVgfmJrpKSuiJ0p5f5s1k/4r2Ex
         YS7UdZT0tyV1u0bVPo7buN0nRL3TJBiVvuVcXzTudvQQuYkQLdfc8vkbO6aRKUg+Xzz0
         +rCA==
X-Forwarded-Encrypted: i=1; AJvYcCUBw0iw7ooH2SEH105WtgwDNrLXXBPrA9wW/FcksPMslfRfAU4rkou/r133di6jjVo/u963UoB7iFk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVTv3TvcVkjZNyMqoddVqnVAj6uLMfxTrmievfddEEbskfqDKK
	Bry4zLP3tjMY6hSsIJe0SCuL3Oxv6iOvX2i0FdLV3rCaobQ58KYV
X-Gm-Gg: ASbGncskZgSxBpN9G9ZwK32SSSv90uWed+jWUsd6MpBvpx9PcM07y8rLfg067q6tZkD
	Xz+O5B+2W+Zjv1NvkTzU6A2Saq+B0j1rBhYPvbPijhFfhAVfqKzBzHU43KVlnkuinkFpEU5VjAt
	NKd9Kwsbn2Q8LdSJOdysqzF/1M1clWXtbHQECMXqFaBGwV7P+zsvnzzCdTl8FFigeXxdsXi870U
	tLIoOfxH/hXDTmKhYLiZWMsGssmZYsz93+MRsMmJRYf/I6/K1FZO69et7/Y5Qnp8QQp6cFDd2VM
	0wuGlrdILWRKRsgcnOIxD2D70kWW5G85mmTBuqfZxpY1LW/lHtdyTShi
X-Google-Smtp-Source: AGHT+IHbMWEVOubhP8X9psmxxmvHUjnp2Da3yrH5tyGilfGOwqHtwm1WTVAYDoMFuzjd1nirp2a0lA==
X-Received: by 2002:a17:90b:2f10:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-2fce75d8389mr20940871a91.0.1740329060473;
        Sun, 23 Feb 2025 08:44:20 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:20 -0800 (PST)
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
	akpm@linux-foundation.org
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 08/17] lib/bch: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:08 +0800
Message-Id: <20250223164217.2139331-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..769459749982 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -311,18 +311,6 @@ static inline int deg(unsigned int poly)
 	return fls(poly)-1;
 }
 
-static inline int parity(unsigned int x)
-{
-	/*
-	 * public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	x ^= x >> 1;
-	x ^= x >> 2;
-	x = (x & 0x11111111U) * 0x11111111U;
-	return (x >> 28) & 1;
-}
-
 /* Galois field basic operations: multiply, divide, inverse, etc. */
 
 static inline unsigned int gf_mul(struct bch_control *bch, unsigned int a,
@@ -524,7 +512,7 @@ static int solve_linear_system(struct bch_control *bch, unsigned int *rows,
 		tmp = 0;
 		for (r = m-1; r >= 0; r--) {
 			mask = rows[r] & (tmp|1);
-			tmp |= parity(mask) << (m-r);
+			tmp |= parity32(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1

