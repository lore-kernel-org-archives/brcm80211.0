Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE7269826
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213546; cv=none; b=udWe/Wdr8ckmcdgIefzNQvY7HPLGbvcsGJODIXFOS6nCggkCvMY16Z19LfUbySgJ/xxCYFXBKIjMNISeOEW7nc+Pi0bUvc0mxgRCdcggEuGNgH02N3eH+YW9LRsGJfODfNahZ43DZ0ciYkzgd5OTCNWT8cy5JEMiiZN03Z2vUqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213546; c=relaxed/simple;
	bh=yUb8DFUy4I0Hz+Ls1dIGoJuPKJueQIprpNYXIuIwr9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U7lrZPC7RN/GSfEGC755Xusnlelj4UzZB3PByXfAVwXUswFdcZWsnp+X7DQ1Xjh2AFwVy6lIkGfR1Ldkob7fh1M8UCWBH1C5Vv+FEAevXOOIbZ1f+jhQuq7CfLbNLSl3zwWokFGZLtD/VK9sgby8q2E68cCCZWND5LDPGBaCx0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xr/h6qnU; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xr/h6qnU"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ad51f427054so4792315a12.1
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213544; x=1744818344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTd+jcAteb5XQtuvZoTF72DclP9q3bsZAYfMztua9WA=;
        b=Xr/h6qnUWOj1UWUjYM6aAU0Cz8cb3jQQa382VlGn4z+2VPFq+w/7Lk4TF1PwTZh5OO
         /SG0rzhAuxKlfuowP36iJZePnF1cg4GvaplvajavIprY/WlYdFgvgmzCK2t310w/CoLR
         qhQOwprKxfXBiCujyPTWB97zcb4TV2XHCw4zCWS/pYzhNrgtAH3bPxgLFHLWPMs21Rem
         JAF094jhGgIHi6l5y4NjhO4t8hfqpaL5MbYsOgf3a8qhaDJRFgTRHy5xLeg4waEwhWEN
         3qUdk6vHUZD1nWvHdPPZrk8CGPPGuxPP5jaE71btqlgPdVx75JY5Bw4AjmW88YQPysav
         rHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213544; x=1744818344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTd+jcAteb5XQtuvZoTF72DclP9q3bsZAYfMztua9WA=;
        b=eH9/+XxBBqBUVAUixL3ld4S1LmRltbZq+Fx4uLCtiGKZLPKEAuoEyEvZh1avJ1OMjJ
         2giNU+Z39HjGDo4PN/Onkihl237/IveED0dW3WBSGkrK1STWH5DCaNZL/wlJYn/BDSS2
         wJ5XmfXn2X9rgciYhKbJHvfsOWaxZEIRrPKvche7g9jhOBhERrBt24vAhKa3RTKqduyL
         1qIWeMDnCqNdBrTCrO9l/rBG62Lg+knkFiMwsayRX4XS2W8Ad1Hl1TXgMN1ZjoyZj3h+
         vhIq80NOOoztQprEXLOL6P0lXRB5Pxbp/H2ERvQXz52fsCbLnmn12ulhhmacR3YCgCWQ
         UzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNCKRLbO7e3qW48GVLNaMS1yRo5JXgst/2DFdSJre0NTZGQO0WyWb5PQjjhN3Fx3UB2lZQ1gmTbhU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwO+tli+8LvxfcNjcJev6xcz/mbj7Eo96sjIsh35Or4UzSQGOWR
	7KK8uKXcqVZ1EpKRLzqQbX9oLi6qGfUxHYV5DzgRk7mVz0q7gLP4
X-Gm-Gg: ASbGncsKgLgcT1F9Lcq85wYCUoud1HkLH8x87vWWpHeWVDhb+5o/uJ1OejkTZLKzH81
	1528lnoLmoDXXU4zfzQlbZJPt/JBHwCweHqVzO2c/VNMojQozwIwcr9h90pD/leWuv4qfMSUgMC
	HGjtirFa5sZeb/cK2LnyoGjSBVuTbMWGBATm6gazI/xUeavkIqLUUcuEqJhWRrVqE26Kx2ttbjJ
	cDjYh0Ei7Y5oVV0WnERdi0h1vyj2DgXbdGFscT3NyaH6XFMzIAiXfPjiNTBLMcDwh+mjTuJ7mNj
	96Tj53dYh8DSbH/q8gimMdfBeyF7AQF5S/DeY2FlU8fpRmUa2RAAlIFw0rIcJHHcPFUhN0I=
X-Google-Smtp-Source: AGHT+IEJ7Jl6M7/jx+b0QfG2QtnETYXioK/EteWOwSUQmw7SIb5H5CEFmuEhS1eLp2rAJpsPWE7AMg==
X-Received: by 2002:a17:90b:3d09:b0:2ff:6fc3:79c4 with SMTP id 98e67ed59e1d1-306dd56b507mr3990247a91.27.1744213544132;
        Wed, 09 Apr 2025 08:45:44 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:43 -0700 (PDT)
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
Subject: [PATCH v4 06/13] lib/bch: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:49 +0800
Message-Id: <20250409154356.423512-7-visitorckw@gmail.com>
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
 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..3f14d69f373e 100644
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
+			tmp |= parity_odd(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1

