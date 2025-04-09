Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA9269CF7
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213557; cv=none; b=IupYvnnm7I9H8tGb32V5s2fCgx78AgaNUShawEYQqfaYfxsJIqdDSsbP+GOJeCbJQuYW9vinVj3GnrjIg7l4AglogeYIz20nAT0Cx6zvxBxr9DdT/5pvebV1UPwzFNDwdYmJuPNexzf4W+Kz72tTJepWt9jnoKuR8fRAs95MHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213557; c=relaxed/simple;
	bh=ZVFZHQQQk+HI/N3knvHhmroiCBacVnQihS2YvtGWow4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPwwz7UsMRwQDmOk8bdQdWpFD9+V2jlDBolVuP7l6tNkFeOsz5lmIFkRGVgWgTLQneI5z9rnlw8zBqTZ7t+BJEusfqlBzmBQkK6nKnQV+LxE7Bz/wSAjzssNjs0H50YXh0jzWOuD1ib0fbJ9EP1hxoyOw0smNglIE1WYX9Uc/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIGn46GS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIGn46GS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so3627875a91.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213555; x=1744818355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GTX40p8Eu+tWq8rarx+bIs4dwN06BcTyPGidfavgSc=;
        b=CIGn46GSKxJQoGEIUgcU9VTTummgIlOSiQPzbdHghrTuDMthxhzxlOY431hZFB0WJ5
         y+rVktHI9H9AKzoI+tju4kXn1UxLiEtSHJUw3q1dWot0aeCD9VeBemLMrlws+riHO8ZR
         5ylngcyGGZePn3OKKJu4tjx3S+bpqKZJdZZ8oTHzb0a5XF9VmXZ1CI9J3QtfrpSskP2r
         ENFjYcrZi6GOhGA7PxGnWy8ExQ9wxJBNxCXsoXNXbzaGP+mZq1nCqw9ErhfkXHxhLvbq
         /sSsyxqKDtywSgDXej289zdfwg9bU+aHbNsdV35EkgQvTAxRCxEXHLeUooyKtnm41tYg
         VSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213555; x=1744818355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GTX40p8Eu+tWq8rarx+bIs4dwN06BcTyPGidfavgSc=;
        b=OO+Zf912TsUuYOaHrml75brzeTbjOJ02V1pq9Xikw1/zw4n5HiX6HLRTgtEwR1aCD0
         +8SmB9oRndVQDmXpuH24TwUR7Xh3jSN4Kk55GKl21dV7JSAGCZe97ed9IYBQG7eEEB3A
         MmMP8x9NPkGEPj5Lth+vJgiOhHRO+EBwInum2pnmcQuDj080sOsEHV5o9Kxcxg7B8o7J
         8UOU4qs7xtLjS8Nwoo8rgo8RPfTFf95DY34kLJsqjHg7ogfH0934giGVS5g0DUVGgzUW
         DWH7agZqM4A5L5z8h1rarosIeILnHRAhtBxF7t8paNpXr70H/Ppxk2PouMneUKggUg50
         +2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXfLfdgGM98D2KohLXCZxnLpn5n127Z1uiMr4740fCnovXAfgbPOFIxTlDOI5gKzhw4XW9ib4Ve3c8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxziZTjmYwpKrEl6UDDQTthmxqNeuuaSeayJMeDJ38ykVzeKsqz
	vr1E8UBRads9FUZ4arvHNAWbZxNlfRlalcNlYiBCSZCEUxNVF1RD
X-Gm-Gg: ASbGncvmACb3Fh74RnV9bp8f6+jViIaamv8SW2Sz4xNHGIaY18lnpCEMDvnbYnsdwbU
	/oR9w6O8GnWh8cxMHBWnJ2enCw6vdErgoXt0Gm/C5ZCanH7E9cTCHU0LKF/0U+V+cY/gTUU1O6O
	bUHqDjAF7Iose1JyLC3xSVsacJEjBocL0sveYM4MOJ9D299CEs2YaL9QEnryiOVMsbsuHqXCAwR
	e0yli2LXSyoyYfO0YwdSn796nIAEIn2XhkPAXmzj1giulPxtNgc0VgsYgx4PTQHtRwV7yPnSZf+
	TZjvoKp5izjEnoCLUuPDvJ/fwy7j9OyNkBfhWzvXE4sm7MymhZdqJNCo4hy8N8wkHPXV6QM=
X-Google-Smtp-Source: AGHT+IG+nlKBY0fzC5EpfikKx++hN068mStMCGrKOPeFQ0KT+ZFhaeW1hEnEku5KKvT2BN4jgM2ClA==
X-Received: by 2002:a17:90b:2dca:b0:305:2d28:e435 with SMTP id 98e67ed59e1d1-306dbb8e7d2mr5088169a91.7.1744213555184;
        Wed, 09 Apr 2025 08:45:55 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:54 -0700 (PDT)
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
Subject: [PATCH v4 07/13] Input: joystick - Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:50 +0800
Message-Id: <20250409154356.423512-8-visitorckw@gmail.com>
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
 drivers/input/joystick/grip_mp.c    | 17 ++---------------
 drivers/input/joystick/sidewinder.c | 25 +++++--------------------
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..e7f60a83a89b 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 #include <linux/jiffies.h>
+#include <linux/bitops.h>
 
 #define DRIVER_DESC	"Gravis Grip Multiport driver"
 
@@ -112,20 +113,6 @@ static const int axis_map[] = { 5, 9, 1, 5, 6, 10, 2, 6, 4, 8, 0, 4, 5, 9, 1, 5
 
 static int register_slot(int i, struct grip_mp *grip);
 
-/*
- * Returns whether an odd or even number of bits are on in pkt.
- */
-
-static int bit_parity(u32 pkt)
-{
-	int x = pkt ^ (pkt >> 16);
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * Poll gameport; return true if all bits set in 'onbits' are on and
  * all bits set in 'offbits' are off.
@@ -236,7 +223,7 @@ static int mp_io(struct gameport* gameport, int sendflags, int sendcode, u32 *pa
 		pkt = (pkt >> 2) | 0xf0000000;
 	}
 
-	if (bit_parity(pkt) == 1)
+	if (parity_odd(pkt))
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 3a5873e5fcb3..fb6f7004a485 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -7,6 +7,7 @@
  * Microsoft SideWinder joystick family driver for Linux
  */
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -240,22 +241,6 @@ static void sw_init_digital(struct gameport *gameport)
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
-
 /*
  * sw_ccheck() checks synchronization bits and computes checksum of nibbles.
  */
@@ -316,7 +301,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 			for (i = 0; i < sw->number; i ++) {
 
-				if (sw_parity(GB(i*15,15)))
+				if (parity_odd(GB(i*15,15)))
 					return -1;
 
 				input_report_abs(sw->dev[i], ABS_X, GB(i*15+3,1) - GB(i*15+2,1));
@@ -333,7 +318,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 		case SW_ID_PP:
 		case SW_ID_FFP:
 
-			if (!sw_parity(GB(0,48)) || (hat = GB(42,4)) > 8)
+			if (!parity_odd(GB(0,48)) || (hat = GB(42,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -354,7 +339,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FSP:
 
-			if (!sw_parity(GB(0,43)) || (hat = GB(28,4)) > 8)
+			if (!parity_odd(GB(0,43)) || (hat = GB(28,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -379,7 +364,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FFW:
 
-			if (!sw_parity(GB(0,33)))
+			if (!parity_odd(GB(0,33)))
 				return -1;
 
 			dev = sw->dev[0];
-- 
2.34.1

