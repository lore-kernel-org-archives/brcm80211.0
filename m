Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59A7212FAA
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278511; cv=none; b=i7C2kgZMsR8eiHt+8Iunmp2A+Y/27UH6VFZkLZwh+CMFEfalP9EnYkn6IARz0gGOFF8TmemALXd9CfJiJgvLzVt6sRv5+vd5LDcAhpIgovisS4d0EEAAD4HQDPS84np6pQ/1AtR+Lgm18Q4+tMhKvvIcm0Q/vQvbIvgfaWL87ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278511; c=relaxed/simple;
	bh=AY7VWX2z+11go+VbveW5z1yOms0/k4EYUoJbq8u7HBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAIV/mFeMgUe/5YPHSV/U79PtfUnv7+RNQIFy9g1VM3BWc5L1Z7GY74MWaAqLyRkfHGqb1k4x+izmzqWf0CEic5w1cqeEu8hNFSpFVDkGuN0Rgplt1Uh3wpuTfZde6HdKxWvfD79MyTFCJBEayNYp1Dq4svRWOCS97WaGjOZ/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDPoEV+w; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDPoEV+w"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso435008a91.3
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278509; x=1741883309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=QDPoEV+wFPrwospnIFVb7Q7Ttpj6tvn3CXwLJmJm/yG03+GXzAY3SoGTTtTWonXFck
         2lk/NCzdYZ7MGNw2GNUtv8iDXpu9VB9Z1FRSbZZj+iGhGFkDyqXMhpl7Ez1ZyUkZ/fkX
         GXHmZL7PVi1YOesiivqPKsjC4FkF/zc2A2muDbF0ndNFu+xx4D/letbOjf0cgy+QzTaY
         UY+L7lk/ci/LpMB5VSlj2sYnPJyyglNUKfDU+xHfLuAbP7pCQEWPDw/Kp4sF5SQtJU+E
         UtlBIHF3rngfyJkmEssifsOVibEXMulqOhYV+9tqZ4JLRz4WnWNlPYuaA6T4SPYlSaNs
         OGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278509; x=1741883309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=K7M1ulEB2o37hwcAnupjQvrhdP8VBoLZV2Lk7JRImN0gNOZORqU4yWk1BugqMMl7fH
         2+EBxqiR55xcNJgyvZuLEfecvqz0QxBkawQrwvhMVg0+t4f+7BwW5aS4XNvqLsQIcnYc
         2jlCKblJAYm7Zi0ic8PSznAQ/Q+g6ZXlgeKuqP0WZ+pgR9IoWFfsRBJ/IDrhFnhMu/c8
         NOEbTZKEYTmRXaS/ts86AQWR5cyUU+hy07o/NU0KgpmbpELNTNhu5BozCraXDNCPp9Vx
         M+2NF312xYwat55LkBliC11Umar3n7ZwO+F/Vr3aCma6rbtaxAn6sCVAs+M9pePyU88c
         y0TA==
X-Forwarded-Encrypted: i=1; AJvYcCWbZr4kHoeUeSyJuI39dAIXCdKWoAnONpqEknK5Pc1H0/RgbK/3HNCaM/1l1xPDdSx40A6q4b5P/b4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzC/Qt/4Geg/nuRYieXWnJ3cO/E3V3eqmo/qr45OxhrSczR4MKv
	VSUzvMYyMO1fmk2P8mqZJ6jsXRPjhjWOvpMxZx4pJ/x3iTYyrDgP
X-Gm-Gg: ASbGnctqAsR5iz8ZwJViYDjTNw99mj3IUvEFUuAgGgO14ICAhgpWgLnWATuQ532XHdk
	8GqDSpI5IPuzPEvM18d7iahrWjkDsdlpfeh1MqDaCi39rGmNtAkB0mD8CMf9kTUR/da6rbCr9NS
	+V2tpG4xpZj8HBoxqQbnLq+15peem7ZUDQF4jeUZjYble/Vmb+MQXgqSvAFnq56rApP+D0Dzjmv
	+wiyAz1hre0kJh8nZbRGy2Rhq+WyQHxIbAJ+s7aPfekpUzvk4chYmHaNOmLiRaw472+mxrVzdte
	oIJaBRv+M+BcJT2gLO3TyhCsOM7PZcN+h3BR+f3cfF6RiBMa+Pby+T0TV9jLoUvtvLIGfwge2nI
	=
X-Google-Smtp-Source: AGHT+IE7CMC10LMwovhBW4tB6jZafU5napSqaqhkL82rznmGKafZamE59+csgSshd0lW2KvQujLljw==
X-Received: by 2002:a17:90b:568b:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-2ff49728389mr14240353a91.14.1741278507670;
        Thu, 06 Mar 2025 08:28:27 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:27 -0800 (PST)
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
Subject: [PATCH v3 15/16] Input: joystick - Replace open-coded parity calculation with parity64()
Date: Fri,  7 Mar 2025 00:25:40 +0800
Message-Id: <20250306162541.2633025-16-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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

