Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC741E0E0D
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839263; cv=none; b=gnGuo34CjmtiM4IMx9dJWInNXUELtuB7cF1iIC7ufyuxPk4lJuXXtu2b1r4e0OCXWj8JaKcbj7gVmIZ2b/NKVs3v8YvnJOKLPCPmUnfODghasx8rdg/cjCyO1BX3/JCSDCO6HI8lc1K4xKmzm9jhSZCft/Aj4Gur0DE/nT0JqpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839263; c=relaxed/simple;
	bh=6rZCyADuBKXQMtzY8frtZm7r8BeFGku217x/vpm4MWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R73n9yVWVlZ983hQidGqJI6Nl9JGw+ks3oeUN61ux9GTu8CV+cDrjVg6nKACVE5yaKIdywV5QUGhW26gkskXbPhz5PmfQJhpiR+xapC7khosHBof24odSZe9lKHN2DBrqLATqIk+7esFnGbRztzFJOOQ6cAf1qUVa/HuHTbjcqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw6/4Ad8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw6/4Ad8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223378e2b0dso44916805ad.0
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839261; x=1741444061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=Yw6/4Ad8HBFww+JEaZwAMVJWB82clj8Gdc4LM0trLZEVU0lzHiEnnAUCOyStx7frHG
         KzQ7pNMlWDOfZe0pVPF0QR17armkqE5LqUVSArO4AkZ7jAh5v+N0DcXIDayrZ6vKQanr
         dq/GV3WbDnAjz8tHErQloyz3z2pBscgQk2XTOD9CxFWO7S/yv/q640xm+va7T+JnUYf1
         qKUh8SQYsOmWDn8VeEi1W4v3x5mwU1ZsqqyCjnuNWDb/psmCATIi6Xp+DgSdkXEZgl47
         3VhZUE4CniOf8D/f0W4AxAydk1ltySq7us1jPdfZW7K4ADjeDat0NfhM2Ze3+HDSXMF+
         Vv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839261; x=1741444061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
        b=eTW0DA1fyseeqMF39EUMAWb8W4etMMwX5Pin89KQoCG5dFcez3mfNjUYnChN6PDz5u
         xFWB0o/A7TdBi9Wvt6pgXNhuAAKe9d7u6ZKmoV3n6s3iFEAPJYxTwExo9CDpO2Nk/hY8
         URNCZ5VG7kQ9hQTrc5twY5035W6vuZ+j7P5DQp/VhUb8PJ2kQI7V742fVip8Kft5nVld
         3f8Vj3hcKJqDTDa5EibqacNb1p+/EuQtQRTVEmeMLAC46mhz6+GG8N1Q/7C9znf9Onna
         jDAtWJi7iIwg1KxKzaqd8foLWNBPOwOMPQMlRkkkxIPcPs1QIePn5qLUHQWse3Ot+fxU
         W3dA==
X-Forwarded-Encrypted: i=1; AJvYcCXFC7s2z3GmckapUSKFrJWIwZcN5i87sS0h72eJDP2igVtzTwRnpa56V5b70m+mmnfkVqb7jEQshoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrxehJ5ot2SC02xRD9wjHwPEfs5shRdQXpvRSoBGpnGkL9LnPM
	ux5aIXBnnh50Zh7VYwk1cpIMKMhoda7Gh0IK4EpZITyChUiPpbcC
X-Gm-Gg: ASbGncu4oo79mE2PqmyYgUoO8/30XFSkHQV8S3M/+BwMG5bZcizC1S8Lit9cArU4vrF
	DSZW4rxQMGEs5sZ932Le1kd6EMV5WCnLyYSfBeq/FoFn2s6WkFAA9/Zg2W0eZUgk8TNIKY+vu7L
	8tYuG1zalPXmD/nWwhFIPAYBl4Flsaj9QZevnWgJ9xVJhbvvvkibY2aHa4x5KIcfkJ95POaJsvq
	CS5xNWkOzLm5jxhlWFKuAV/fbur3c6OKMdSYdSFvYGNwrKCiRPxKjyM/UoHtQJJtsxfYwU4Tdsp
	wxr1VPogx/S28bzteoOYlFAjd3Rq0p+RvTL18Mgqd7ETPnMEJIZUFqTKEABJlngC1PGHhQrb32Q
	=
X-Google-Smtp-Source: AGHT+IFiFnyov77ut9ZE0KvFExTJSaeHLpVxCuPiHzGuQy81Az6d7l02LfGDhYVm8qdT93KSy9qqzw==
X-Received: by 2002:a17:902:ce91:b0:223:64bb:f657 with SMTP id d9443c01a7336-2236922352bmr101615155ad.46.1740839261506;
        Sat, 01 Mar 2025 06:27:41 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:40 -0800 (PST)
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
Subject: [PATCH v2 14/18] fsi: i2cr: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:05 +0800
Message-Id: <20250301142409.2513835-15-visitorckw@gmail.com>
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
 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..8212b99ab2f9 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,14 +39,7 @@ static const u8 i2cr_cfam[] = {
 
 static bool i2cr_check_parity32(u32 v, bool parity)
 {
-	u32 i;
-
-	for (i = 0; i < 32; ++i) {
-		if (v & (1u << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1

