Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6821D26E140
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213515; cv=none; b=Qa2uKzkcyGOg2xu9itZYPygFzrzIfK3DRqBwQ21d0tOi8Pg4hOCYHoPaeuggW+lwcNVGCmCyYflXuF9Z6gHKWOXdymCDKZvDRgTMVTnZADloYumq3O1T0xZlKzdY3zuzbPMlTOvo92p44bzblXeJ234WjdgIvQr+4oGdM4tW2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213515; c=relaxed/simple;
	bh=K0cAwDEVmURUDqUksW8EcGktpkwwMicB1j4NdDMd+qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EG7HahJMy5uEswSSTS0UxAz99MemAmWKo/HqgOnCAZF+5eq59HXTj7lFb/xet8VQchGXEANTDQLYUp7gvvwUR5GhP5FAmPeC44rvSlfUEnqeZ3dD33VCwNzyFImTCeGtdTF6XEdumUwMJE7cc9xkBaY5x/Z5eGzOOunV/p9JRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltULzRfW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltULzRfW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30572effb26so6492378a91.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213513; x=1744818313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vmckaFkj9v1ziFLew45kxKFqGeGwuFVGwp5LAE34T4=;
        b=ltULzRfWiROfSWAIOxoq9r7j+iYwVpo5hjDxgc0GJyfvpxYmu+UUolZa5+m8mz39Kj
         80QTSwlAawJybsqq8560X0hQkni8Fkd3Mh/dWp3uXciziKDRm6GolH1l3/eCK4aLRYNU
         O5uqijqFAtwKh4cLnl+w+r2YWXKsdJxkfrnr0BcP5+FACaYekVIgo72kSfUNod47Akb7
         M63B+2D/FFoh1W4Y5uINBxLqZgGRLEUXuzZFEdmNc56pbDya9le9pccyb5QFWFmVHq2Q
         ymIWBBNP6XSafw50yf4xSa9it8Fx/ywWzofglMUNO2dyGIxbxJ/Jui42Xkg0mDyH984H
         QMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213513; x=1744818313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vmckaFkj9v1ziFLew45kxKFqGeGwuFVGwp5LAE34T4=;
        b=thYItsaezSKOfjZeM7XN9uNnbwUgytW5QI7Otd7bKLPYt6uwTp9O926ss/wTr+Ls72
         TBfhF7q7auTQz2u59TBHWtmGJ+woxOdjUqRy96GgecEPDc3Ergq6zW27WBpR/5R9MnLn
         IjyJlfYio4TNSF2EfuIJ+IgooHYX0E+kQe2DzijCOPRn1Wt/IFMsTh2cNqynZAOVJFzO
         bAD4zF7g64BL07+X/D/KwsD98NrDhLxWKn0IVbLzSDyusj78g6UlcU0Whk4096lUkDY2
         zJpxw6wujKdAU3P4FQhdYDcyngd220wvQGKIdw6gFfeZRR1qvjraIF+jLfoB1NM/B7oM
         cp0w==
X-Forwarded-Encrypted: i=1; AJvYcCVpX8K4qUkAVMuvN1AtFQRRESwrxeh2DC6hK1KZmG64N2t13vRL9TMgM6js07pHnHMlqfeyLJRZ8fI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFH+U9vYJsXLLWMCn3qkMXh30euwh/Ih6PutYKzpCrpzJol2o7
	Vr2RY2EAE2g8RMyR0LHUafCW+LSGmTg/pwXW3l0Jsx+4pHyoTi1v
X-Gm-Gg: ASbGnctnNmowG4vjGKSNynX2et9PgAt3tdNuMZ17OlLEYKXPLjNTrQj9zyloruARr5C
	IecpHVJvQRW26pod2RvUKftW1SKf3T4CDmklZrl18sl/BGwSaM78oq36TXOnwxjm3/fxzmmDYBh
	rNRQv44xI2vm1C41lwlbgrAZEJfrkMFA0/DjBYOrWadMxA0IrqK+WD6QzVcZSRhYLhtLpkKV6D5
	oX5qnia6ZqR+Sj/zAO3YTvi8fYjUUsHOc2sKtohhEWC6CiGf1n4nnuy9w/brSJqVO2y7MBezS29
	sYF+9bRWDNK0BhpJThixSz16WDNYr2MdYJxTB77qeJgZaCrV+/DUlmMizq6HgKRk2ZzoOJA=
X-Google-Smtp-Source: AGHT+IFGakXWHWi8mPXKxnYyjY+QGe+hrJ1DKxm8mqQTtmCR5lZ2ol4+lqNevSMOwq7LjWocz+r/eA==
X-Received: by 2002:a17:90a:da88:b0:2f9:c139:b61f with SMTP id 98e67ed59e1d1-306dbbb557amr5410743a91.14.1744213513621;
        Wed, 09 Apr 2025 08:45:13 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:13 -0700 (PDT)
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
Subject: [PATCH v4 04/13] media: saa7115: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:47 +0800
Message-Id: <20250409154356.423512-5-visitorckw@gmail.com>
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
 drivers/media/i2c/saa7115.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..a7886269dcfc 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -25,6 +25,7 @@
 
 #include "saa711x_regs.h"
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -664,15 +665,6 @@ static const unsigned char saa7115_init_misc[] = {
 	0x00, 0x00
 };
 
-static int saa711x_odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int saa711x_decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -1227,7 +1219,7 @@ static int saa711x_decode_vbi_line(struct v4l2_subdev *sd, struct v4l2_decode_vb
 		vbi->type = V4L2_SLICED_TELETEXT_B;
 		break;
 	case 4:
-		if (!saa711x_odd_parity(p[0]) || !saa711x_odd_parity(p[1]))
+		if (!parity_odd(p[0]) || !parity_odd(p[1]))
 			return 0;
 		vbi->type = V4L2_SLICED_CAPTION_525;
 		break;
-- 
2.34.1

