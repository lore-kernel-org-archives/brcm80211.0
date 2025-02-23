Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC11369A8
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329150; cv=none; b=kvQ/XCo9/J9ywkUOh4oEfG61ZFInTEDQGld+/w2VsvmfXt1bP35UETse0XvVz8BfWIjB0qlv9PTLTDP33jgdBHbLOwrIH+2BbFboqtSSlw8BqVVy6ABQe321Gpd0P888yTQRuBjus3yf43ky6R2Fm9As49XVhijpqYFJkAFNXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329150; c=relaxed/simple;
	bh=AY7VWX2z+11go+VbveW5z1yOms0/k4EYUoJbq8u7HBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=adpufmmXG8C3XdI+e8/g/3QT8UWr32r7d3jiDZ22GmARMOC4mB6IJXfXRQpneC4Z6qu/ENO/iWEJii9Sw/EXwXpeQr39OQB7HETXlRyiwRL73LPhDHt6w8T90yycsINGLU4OrrGGgB1NvGph7o/v7I66LbtK5C6VN4IC2OYZIZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMWBHEAC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMWBHEAC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so5837981a91.2
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329148; x=1740933948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=gMWBHEACOq60auRpBtFAnnb8JXa0Jty4gAP3EF5Rj20y2tPDutbUThOsXLlBPg9e12
         ch23ii8r1C+ZPomKRLKuMdAlQB9xIge+sA9gZrmaiauYCzOP6FJlqbxwV/92nSaSY9Za
         8J8IQvnNnuCqvLoceicWwc3ml/0WV2Sk2/sRXk2NmteKpnN3DAbNnUshTPRUvfZM45HR
         5EmAueAJeCYl3udLac7p0298ub7lJWStmxVXH+gtF9s7COio3l1wE/IZ57Yssr+qnWRR
         MoJ/4NQKOGvgEYh93YCE/jysIPIvs8y0S7bMCkWk4Gb6x1mwXcWWIn2oFqktZJe1tJXJ
         Rouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329148; x=1740933948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=u7cgEUaJlPWZtz1W9SQC61CVZYA2gTYpODgSRSWypbSY56lWYebXIOE8or/Tvn3yDU
         whK4cxISrXWf+dA/fn7SW/OKlvNQdB040v29Q2X9Zkv4z8izLLQ6jpSYkdzzphoKx+1k
         gPeat/tsUkK93ZgUuHNrJzDeffOodJz9IvLDoGjoFPwpqTeyk8Jk7d/PWGeGG6r7Fxnw
         WRpyweVjWM5BvPsSlQ0W61ZawKSAvZUWgHhhFN1iIBX9M3G8TBBdovbLcbTDqYJRssBQ
         EhviT7scPPoQV7W39yJwBG+9tukxPsjBjjDjp242pm5TR25LYEHCECrAzVs66ohld5FW
         3oPA==
X-Forwarded-Encrypted: i=1; AJvYcCUtqfyyd29EHzcK5EORm6HVM4CbCFRPuln3cPF9SVMbEkOzjSKBUTLL3UkHH+OMlW+JjEXJX6Be60E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkr0xgphHZYwkPvXTuda1EtHoDVH868/SOqNNhdsnkjj7Sj5SR
	rUSFxd+Cr1WjtYQjcfC8Xe4p7VH06cytmPfLery1b0oueP2D+krP
X-Gm-Gg: ASbGncsW+plXPmu/OEhizZQiPQ9f0ieySImk3I6dCimqLG989K8IyhKbxe1nDbTDPO1
	+o2LcZ1Z5DcdaWPJbgl7+A6funlBdz03oGK9dXYn8+cJaHX0okv0kYRCEq2orXx0xU4/rNzwFs7
	D5mnxLZBGqtSG3+4p5MuizujwRAxDdMS02eFCqwd1X5e6t9hROCCWWjppFtZyvIST+gB9+zXl+C
	8QIzy7KJA3jZfzNFOlvB5UvUvQ2E8JHNPDFRkgcqBFSJC4y5PLLzsUETItoDYEwrowQyKYLQXTo
	mfHazzdmeUln53fE3+tnx4/la78QIwSA89ic19hFauxNAH4HbRNh3P2R
X-Google-Smtp-Source: AGHT+IH16ghKmcmHU0dMEzazIh6n32euSF7ezcTZFrtw55Mtl4npk2uitkdtvmkXgShJlJHnv8p1XQ==
X-Received: by 2002:a17:90b:3c03:b0:2fa:12be:f16a with SMTP id 98e67ed59e1d1-2fce7b43488mr17785880a91.29.1740329147892;
        Sun, 23 Feb 2025 08:45:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:47 -0800 (PST)
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
Subject: [PATCH 16/17] Input: joystick - Replace open-coded parity calculation with parity64()
Date: Mon, 24 Feb 2025 00:42:16 +0800
Message-Id: <20250223164217.2139331-17-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/sidewinder.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 3a5873e5fcb3..9fe980096f70 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -7,6 +7,7 @@
  * Microsoft SideWinder joystick family driver for Linux
  */
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -240,21 +241,6 @@ static void sw_init_digital(struct gameport *gameport)
 	local_irq_restore(flags);
 }
 
-/*
- * sw_parity() computes parity of __u64
- */
-
-static int sw_parity(__u64 t)
-{
-	int x = t ^ (t >> 32);
-
-	x ^= x >> 16;
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
 
 /*
  * sw_ccheck() checks synchronization bits and computes checksum of nibbles.
@@ -316,7 +302,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 			for (i = 0; i < sw->number; i ++) {
 
-				if (sw_parity(GB(i*15,15)))
+				if (parity64(GB(i*15,15)))
 					return -1;
 
 				input_report_abs(sw->dev[i], ABS_X, GB(i*15+3,1) - GB(i*15+2,1));
@@ -333,7 +319,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 		case SW_ID_PP:
 		case SW_ID_FFP:
 
-			if (!sw_parity(GB(0,48)) || (hat = GB(42,4)) > 8)
+			if (!parity64(GB(0,48)) || (hat = GB(42,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -354,7 +340,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FSP:
 
-			if (!sw_parity(GB(0,43)) || (hat = GB(28,4)) > 8)
+			if (!parity64(GB(0,43)) || (hat = GB(28,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -379,7 +365,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FFW:
 
-			if (!sw_parity(GB(0,33)))
+			if (!parity64(GB(0,33)))
 				return -1;
 
 			dev = sw->dev[0];
-- 
2.34.1

