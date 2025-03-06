Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19120218AAC
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278440; cv=none; b=t6gMwytJgWgUkXNnkJf8jnHuc4B95Us4QdnXXg1sYV7jM0gY87HUFI+TNoLVirY0hyVeWOjxx5xb+gXlWRRD9of+p3B1+CZiZ6eF2pX83bdSpmWiqw5vT7raxrjCV/gzI1C8n0lQeyg0vW21tW9WNDF9qgv1bG3JRJGYuoEguIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278440; c=relaxed/simple;
	bh=3j2xCVO3a9Gv7A0MIU2nyyU4C5wyCWXboaTPOU2Xcdg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qqa9Ra6+6NJcpcHLfAfEZm2eMjB4PWTwb34W3+dfoaw44ZuYhfGrMianT8s7aeJU97Z/mJg1ife9kmz8k2NSs9EbrIGnENHC/iGiqTKhAphj3i7lFpDnoUrTFuuOk4bHMi1BSyrhQXYP9+iJImB1D4SK++rhtWZ07r9/u7DU2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjGqvtcz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjGqvtcz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22401f4d35aso16462195ad.2
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278438; x=1741883238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN5ImNH6dAdBfCykY87Jt3WvSMwHnviLIgPuEMqr3Q4=;
        b=RjGqvtcz0IXQ6up58AiX4ThKJ2KxY38tKMdlG+IwmIdZkF6nn1UB/c13NKoAhWzE5D
         oa9lYkISNCtrRmLFNigVlqbnUWf4SuLJgH33jWDMAXbX97aj6Dd+oSh+0NmYYC81vcRQ
         rG2CtaFRldOlG47izfWhzQWBIbfeANXWYXPDOzLAxODTI8IyItwOBdvHGtG0KeQFmZVN
         MfOV0P2oJhF3bXqbvhf3LYq0+ymzCNz4e2UFULqU8GKHQGpTqNpU/wQv7lBkZpWddVfb
         0mlqM0/l5Carg6WxKzgWmSSDoCWL0pPhfkuEPHq59vG/bvQ69iidjr+xzKxQsK8MS/j/
         UFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278438; x=1741883238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN5ImNH6dAdBfCykY87Jt3WvSMwHnviLIgPuEMqr3Q4=;
        b=X+hGuoRfm3bdT/or/t3HraB2nSQN66onbqXJOkc/Cq5juxpRhUMBymdwmcK0CAqzpy
         JYsGq14G/xQStFeC7e6lI0fAJnvbRTC32X1M2G2wJ09N1Z/3AnoiLeBt39yiC2ZtBtZ2
         xvZSME6F7HlnCbd12MSIk/wf7hopOsayA5TMrU8tW6ku5NrZtNhgruG/4c16Vrl9yUZ1
         XdJCWQlqqLStyPC2oWr0USAHotsXEaCDNPR0oBeYMDgLOwFHz0Y9dMKpQHhmEiTe6mbV
         S8xn30MORamizs30dfUZHo5g5nANZTwSDBYm90kSfLlowxFhgeebtnU1udMsNY+P57yJ
         M+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV+pAgR1RzBh9kLFwBM7Umfo8iZikLifEJMIg2DHFbCkQp/dAqVgRvkvnVWqCZTzXGA1MT6TgeXoAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFxGnjXR2vl/AFuI6NNwuhaxIREGfL0ztwY/A463fb6Lv9oJO2
	V1zBCAq+3xVAnqt76iSLiVDcFwoMKPRX2iwrK0EHaOLxjEO1rMRa
X-Gm-Gg: ASbGncsDBD7NLctzHhmS7TwGA3WQOxdH7bCKzirwDZuHLXgIYUbZxzWgjQBFpgjaSlc
	7zjgUt3u3BT+QJ4DNP1IwZNXjYjDMe19MNAMVZB7s/fyvBSbADv2JBjgaVTuieIrqGafjG0odJj
	+dg4gU83M1Ha+JgiYpeglo7BwgtfqA8fl5+EOOjnxeSX2x9qbTgJ+k/VMqpNeiA3gWZz5qTcIlz
	2Z6qDigyzcs2xNnzIp5mi+QcfUaUzvbDuSTCU6y+KwF0GK2W5exJMVzjO0Dn8IC8h+5zxpXrFAS
	ujn/5NswCLewBVI6FeCHX5Yq2Rx/cZj/HkNWW0wviHjKxTrvEsKDamoH3CsVrhSTHlDY3boOs2o
	=
X-Google-Smtp-Source: AGHT+IF18uiSk+IKiG1ozkM3lMeST4qvi8jhpDhJUoUXK6z5h5Y70JgwenicEaPtYCl0NNS2nVYnUA==
X-Received: by 2002:a17:902:e5cf:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-2241eaa5f50mr17212195ad.18.1741278438234;
        Thu, 06 Mar 2025 08:27:18 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:17 -0800 (PST)
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
Subject: [PATCH v3 08/16] Input: joystick - Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:33 +0800
Message-Id: <20250306162541.2633025-9-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Change condition if(parity32(pkt) == 1) to if(parity32(pkt)).

 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..26a7ae785942 100644
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
+	if (parity32(pkt))
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1

