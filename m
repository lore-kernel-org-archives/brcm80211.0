Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C691E5B9C
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839284; cv=none; b=hrbRwrlhxBruytDut8OkQIJUQQ2/5Ztrp4rlZRXpPJB2skUs2Zm088KDvL9gKQaY126cJUZvW7WcY/Mo/60nWHLNW19cCKa9d7/YvgyPwWbp0jCIaWqwtGtk+5XCFt8uJHPq3TmuwEQlV/UjNTXUgWgrcS/egnwg1k3as6HWmBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839284; c=relaxed/simple;
	bh=AY7VWX2z+11go+VbveW5z1yOms0/k4EYUoJbq8u7HBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kmV5xQsF4zZG0fCcEY76Zt/ibVpBfr4hTm0VJXBAWq2gEGzpiGQj2nqEQMT8tlDtImJfJAKDOoJFK1a9hrjPF01il4mGFn8ahBUfGGyjXss6WU1Fv207YP+BlE6I6qCgBmyY4wa2241gSaK3vMApArLHyT9hEymlnymc/N5Tbbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwlzbiHq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwlzbiHq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22385253e2bso13341425ad.1
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839282; x=1741444082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=VwlzbiHqfrTDN+Rsc3Vi/L14WjVclgvvCnXfP1xCbFqtr69mvwPV2EKsKTkNBO8sr6
         bNNlvYWcxe1QXiijfUOqk9ctSiN24+bwd0YJAt9BVXHB5b2cwjCXZgqlo9v6eEjupyvn
         eho3Z0upvPxI5Wb2Ws0hL4SlU8YsqN2/f4kbgwzCx2rminnM6qx37e0WCESWHeijRNIv
         sEl3ur6qAoR7lKNo2DFrMI0pLsf+IJZ5kjzXLHNl9mxNuZP7WM1DkPdRoVLHsJ7JeuPw
         w+fHhYGfkyeyHhJweE/uhJhO07/hptRJvEeB2w0afX/G9OXRqRwytJhUBqSDO1M+XMpE
         sGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839282; x=1741444082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
        b=LDBiXGwkgtcApZEGuX/oIgAoKRCvILwEQX6COVZc75fs1GTLc9xLTK216zJ8MI1ocS
         zCa5g4E61r+SiJRZsVfEOBCe4QrIGMgl6A5tL4j1m2Lh9ebwlSHJk3x8wnSQm1H/naGs
         VoNP8jtXIFSeLd9oKxiIV7ReVqTVqjerZsmnJxQCyC+ZKct7t0PueIixTW910kTiwhtX
         GPmAahzDTcGi8Cic1Ug4S2cH1wG3DQfYv6u6RTqKpx7CdlJ8bzipjrA55QB0F9qqXw4j
         eW0/hNyHpGpUYIWUEK1/9/jo0TJnwXW2Wptl7ZgmOS1JFv9W2yBhsVRmY9+pQeCPx70H
         gKRw==
X-Forwarded-Encrypted: i=1; AJvYcCV7n3T1xJ7HIxmQwr5I7YutXGqLvyyZ1G5OIKu07U3037jhT8ZYA8xwP/WBB6vCMJzwGc0VU4mGB0A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCqOHqnW5Fx87MIUhqvVKldAT607DRbsumS7u6j7u7cFI7SPhv
	IMR8MO2KGfrpuie5QoH6nl4seyBQP7JdMiOrs5BgRhuDdiDYcUQz
X-Gm-Gg: ASbGncsJCO2tMs9h+1iLCibu0b9HtL+v4GW5GwTz8R/vhKJ5RCl5tPdUUbUlpYsNIVE
	H7DkcoB613EmU3oLD9ha7N2LhLuqfNUacQg0Wyrg1zOV9Jht8YggJOuVQoo1EEnwnZWyz+mrBUS
	Tlp9X9QGr4N56vrMoEyWKaBpkOyJZFk4G/HJgxMlzTR3HONAS68h3cWIXkW6Hn5GzBDtNCqPEsu
	Ihx/xQk2JZGK12pFlXIZSK4IUwk76fulliYbHtsYlR8AnmnKG4kbEc6I/3Ch6EEYKwPBhFRLIdh
	vQSMmLUPCxl5J7hhC+5PEdA8Bf/or7PPEEdcbcemC0NMzx24s86mYkdxJilhsx2pl9KvSKUEIPU
	=
X-Google-Smtp-Source: AGHT+IE6Wlnx/zKBNSK8vHDH90VpNnFUcC/6AIsKwE//R5+rZAZsk6Mdwf+K5eJJM57bLHOOu0BXag==
X-Received: by 2002:a17:903:f86:b0:223:536d:f67b with SMTP id d9443c01a7336-2236920780dmr123851985ad.38.1740839281880;
        Sat, 01 Mar 2025 06:28:01 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:28:01 -0800 (PST)
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
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 16/18] Input: joystick - Replace open-coded parity calculation with parity64()
Date: Sat,  1 Mar 2025 22:24:07 +0800
Message-Id: <20250301142409.2513835-17-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
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

