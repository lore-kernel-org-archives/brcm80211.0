Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF71E261F
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839179; cv=none; b=NMs8SZO8wvOH92yRvDbYnpq+8FO66Fp73dc9935F/mJCINl5vBmibFRRbjg58Ro/jF0hpOkIQvYKr7hobONj7vKUrSm5msfNZGW4dRHsYc0LMk5ivddWe/b0uWGAxPlsJ7Kb78hXJvTfeXk/O5ah0P4IA4KFvz3CWlXGmx8Msyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839179; c=relaxed/simple;
	bh=j2/wDG0L2QiKPBmNCWrxOGnHtFWO5kAL6+5E33WSh7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kiP0vD2szERpusFgDsl9wuW0gIN6zVX/08RP2zW/pTPWuNX84lsne6kMYUno0BhiCZmQKEZdgiGMX082HH1qzjHfXb/pCaPpAHWKgBNF+wmBvTPf1vaT5LeJ4g3Yvd/JWy91B1e1zYPDtLZyy07kkRrdp777mxLd3Mz/1FcYRrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5ZLBg2O; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5ZLBg2O"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22385253e2bso13322545ad.1
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839177; x=1741443977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=J5ZLBg2OAyqC9ZSE4iuaKO61LVKYHqB/StIBpN56Jv479MxHLlKm+qH//wERMQkev6
         FlAqBckpIK75B2T2QoMkfHUVAwYZ11AKtY9Wd4pDNMm7g53nBtB4eVd9//JgtKjYCfNx
         FHug5b2hSwYYYziZkZJIskbmmLWkGTEuBv1/a/xckXhVcn8D64IXCQWijau7JVm21yeh
         77dDRZSrUciGNZmHTYMerf4mwqninXG/x+fnPlFMJQUiIucECuz8Ashq4FYHFyvxr5gv
         JlgUtuNinr/dYByjg4fltNP14NL/AUqNskKRhJjHkLkds9VYAPRWxgcBNI7SQzxz3IL1
         1Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839177; x=1741443977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=Y8Zz5azvgyaHwalkTPcGI7P9jnRESaJe8s02LzK/zlJ8E0xow+Krj0aej29KDZ0PJu
         1lmsk+c7jyc37B4I+7zejhPiob3rlHad6wXiIEh1fvpv+7G8lB4E9B0JjKDG7LxsMmo4
         aYvqDuSxyvj8JfYJRursNmH+0JeeOQRCoxu1ekQi6DHyb+K4l7+7TDYV1BW7hd9xvjI4
         ZuOB6SeNynhDhwg1XgYko+02L4GApfMM20y9W6JvIeC4vFs1LcyLI2P4x46m+jPyZnWT
         +TBylyHGhPfUSbEvofGAArfnOCBaB1Njxl+mVYe1R2pBJeZ6sW/6Mir+8J1NW+5bRH/S
         kRfA==
X-Forwarded-Encrypted: i=1; AJvYcCVyRkz0SWYnrZzfudNher5/T9D/i1KpWD0ndNsID5CyyWMMUVjS3DJwbXAfmCHnEAs8gqX83ZOJw8U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqJNO7FqC4O6cBTgToMJ41jOM6fW2vMZbq1bASkR1b+Jk406+N
	MtWuuXV8txiEIJNivLwguvgRAwJ1GiOyT50iudB6cpi0G8YDHttf
X-Gm-Gg: ASbGncsgkCbUZdnO1vMQWp17J2mGgT2PN+inZBK3U0pHcVmqZuAUrHjYsl7C1R26jhS
	3kr8EOuyuk+LlGz2UGPDmYdzqxG+gp6yQDU2MJltbSjyhho/l2/paOkXuxiEUP0j8SR3Wj4wz+J
	OGR/Pdx62DZ8RXjnAlO5KelPjvvrlVbTq8cUxFoB0SKXf8meu4Lm7ThRwXsX4enjxA5v+eLp/UM
	qjT8d/Pg7Ku5LtGL6klOlbPvSM2wXap7oTLACMs3M1g40LNXpd7CIYX8oMiAfr05k0tC9Wjpafh
	U1jdMYF3ypVGkABtsLX1hXogQZGymDkK97VHhzWD8y1Gys17Z71SK5znWE41OO21y+YsAbnbMw8
	=
X-Google-Smtp-Source: AGHT+IHr7/bNocCASgkhvMFxO0zdSkmZKMBxSgSw4TIYugdqe+gxkfqzHvRXHP0fkW72YV0RkO2YNg==
X-Received: by 2002:a17:903:2ca:b0:223:4b88:780f with SMTP id d9443c01a7336-22368f7558dmr109533355ad.17.1740839177198;
        Sat, 01 Mar 2025 06:26:17 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:16 -0800 (PST)
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
Subject: [PATCH v2 06/18] media: saa7115: Replace open-coded parity calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:57 +0800
Message-Id: <20250301142409.2513835-7-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/i2c/saa7115.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..b8b8f206ec3a 100644
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
+		if (!parity8(p[0]) || !parity8(p[1]))
 			return 0;
 		vbi->type = V4L2_SLICED_CAPTION_525;
 		break;
-- 
2.34.1

