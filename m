Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E31E1023
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839211; cv=none; b=MssWZorlq7MTxQGJ9SUPRjOoCFbUZBesAdYJ7EYq/tIrDUw9efs7T6Wc29x5qLN4wBs58PFnI+Hu3thJ5npb1jd6vJkFXfJePb+E62awm5fPiK3fgs4vjABn3eg1FsVYOGIxSeC9SSTUj7bQ94wZeIrjVX+UJEGah9EkmSpUkEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839211; c=relaxed/simple;
	bh=1i40o1s3Vqdk2RW0JIo3piubrRjz0Cy5aa5u5siB9VI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oca3wzNcyQeW6mSPqnd5wN+7/pjiu2JFC7u+J8qgPPBOTbK+77sqgpU5Kxonc/Nr8pV9NYAUUzulg/FBP3KswaFPN638AqgROtZxZo7QCRnB/ByYc2QIRPZFTENsrTxnhSdo5ae4tkFU9ssXwvJ+Nc0TOjtl0HRWXpRupfCScKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOYYsIYN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOYYsIYN"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22374f56453so33970995ad.0
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839209; x=1741444009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=hOYYsIYNIgKvD52SGKNZu4Pxv7r0nafIFKYpAE0ViCpYx4tGKE/2jJQqfhJy4ep2pg
         fYdf1wWzvOcmAWAvRktE27pr7GAu2sOnZtB1VO425WiTfux5rLRWuQQkerij9YtSIYAC
         nt3V2AIOojOhbMvItXbzS/j55KlAuuBsFTliqBdLFD4TAvUfO34E6nqLyeEcms2NxHmn
         1JifRLThc6ZmA1ZMec9xACwVErrVGECKNolrDWsgu0qTGQrtIsG1eouZMb/tUjWQHLpz
         Iu0CmrdlOeXmnnnN6rbY5VtsFQn+6mqMPawaOtLRrgFvP6Q8a6Frtsq4nNZpq7xRYy/Q
         7TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839209; x=1741444009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=jbr7VsAnfh425MizjvRmz8Jli2k19x9o08cE1t6V7DHmT8QxUOdROIBcmRn0tfdEZK
         SpAIfivGpouSmdwSwwPpFbDPuiTE/YPGYQU1u6fInKBdlV1MFT4W+lSXPA+IQ2Dxeo6n
         E1Q11T979GIOPm2pgBPXUtRd8bnLMuTDPlABETsJsHjMhHKTQUnMP9tdfEfZTJF0bCwX
         mRCUDnCUagwTbmPD7ZrZUK0iuPkBNFMWpiFhZQ+X9NrFlDybAA8ukt+8Urjp62GSwv3z
         OwQARz9yqoJokfKGseMrIBAF3YB2ri8b7ZCtsQujM6+R1m0ogNTmrBpu4VgBfOlXURN1
         MwmA==
X-Forwarded-Encrypted: i=1; AJvYcCXXNP7xfP3w2zOMTh7qUN6a5iwnHNY8NWyoE/p/ThLIh5LaAlCnuN91xBfHlGsPUva0g+Qx/hddSjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPPAmGudTInZ/bBIHR+AFugvc1vTl/zD2THP74lxNZqihjJwwd
	JcXVzxYs81vn+VRcHBWMqar4VLD1Bbg+lW4iA0NnXMictnk4zduF
X-Gm-Gg: ASbGncuafA7/bB58xLxp/ZI22yttlTRgwzGXFsS3pvvIRnL/QtnOm0mJdUBdcdwkZ/g
	KEUpZTBldccUZ0ih5l/z8TFW+AKdX/g8q5SlGBvJFBGedjIQB4r5zlbEVFTbNAFAw6Qb8wFAUu0
	3QZQtMd6mtNI7+5CAmT9H3zJJr+AP7GxJpcl/nLptK19GyvewHHetWeHTcOTD/KkD0xMioKUy12
	EtNNC/X4JdT5vZnDwD/tUiDYTV1Bh23A/oG4moSX1dpzhYYUZSRyp5Kh2RCu6HN4tvI7PAZWCzC
	5JCGgz5+MjY1bZ4k9ub+S+eh8yh+AjJVn3L2kT4Y6rZuWL2PksISrx5xeTky1f3mTsC3kcQ3sPs
	=
X-Google-Smtp-Source: AGHT+IFGrjgDJrSlPcepaZbcj3TRgBvaEfqqC0e6onE8P6bMgkRDhKKNubsynOimmjCrDvdqjeVQ6w==
X-Received: by 2002:a17:902:cccd:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22368fa8f6fmr116510795ad.20.1740839209574;
        Sat, 01 Mar 2025 06:26:49 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:49 -0800 (PST)
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
Subject: [PATCH v2 09/18] Input: joystick - Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:00 +0800
Message-Id: <20250301142409.2513835-10-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..897ce13753dc 100644
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
+	if (parity32(pkt) == 1)
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1

