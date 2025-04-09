Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83225EF83
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213528; cv=none; b=ogKKVEeUolCnFKWDGVFoS5toguylvHOGLGItjOQ9SgN/UpHqNePOKMjqXEmoRBs0H+HUIATUvesN2dsoJXP/SU47I6nb9X8TR3JJLgy7iKC1bSwEBx6QVrTFcabztadetEPRGQqZ3UOxS0d6WUGmZyumVwdkdZU/9q+/SByuRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213528; c=relaxed/simple;
	bh=jkjX77x+yr1fdHrJPGX688zF46uEgQ4FpItcHmWaXzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=peVmE+HfFPjSP1z3QKwynVZMFuofvlw2AMPf2NbIlFHu5soTxSbi5baFU+0QSYDAXx1yVoy+WWQmZakaAkmpfSIoEy4ri5Oy2xGcP+m3H6cTL1Ar036yuDGfvjezQqHCEpHfVUmhLzDOVJF3eUQOGwJ5F8Yq/wq9D7MZAE6/vMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZT56vN7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZT56vN7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so4197876a91.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213527; x=1744818327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUZBDj1ge3+4V9XGnjqkyMjyFYeNbBPtxuQpoO8Pkmo=;
        b=ZZT56vN73eu3jmVYG5KWvC/+vWKG46flbFggp/l0tA5lUl/D7YIl3vEVE+S6SRVhEv
         9Ux0Xhwr70KUojUNcg/xiOK0GtP6VKDgW5hfYsqbsXFYzjcFlwl5ANg1u37L0vIb34kR
         dQF2LQkSGCGYpoxGG67MuQQUtwPo7tOQ3Mxhx4Fc9IpKIpYpFocVY4Ch5WYnkkz/USjR
         31TeLdPSaWzLmlod9azjk1+5fhIuFDAmIDR3y/bF1H217FTt/D0BJFu2czfZCb/EFQTk
         5mF+fhV8Vw68WrpPfDlCl9sEV1Gvg4EKNxKbym+8zfxZlArVgXT8Gb14vRF6zE5GETxm
         b+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213527; x=1744818327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUZBDj1ge3+4V9XGnjqkyMjyFYeNbBPtxuQpoO8Pkmo=;
        b=ihFzMmVWT1FM63Zm99OBfMpA0mANzoqnMxZ1Hr7ybmp7pHpkm6j1cK7eaQlGFhmB/R
         P93GkWVdFiWLkMvcLnkqVUCshgCd1Q4Cc4M+TFlQDJKo52hnpahX7sP6ag0g8Oxd8gnK
         GOo/GMLJ6NLlzOk4/iVAmLRilTX0HyYeGQlvU2GefOCJYuzyt3jRDQoK/rYOhje4bZAI
         wtC7LxK7rMCS8E/sjL+AdCG0vxtmCyXFLvSrnflKUKijLI4EWxzeaF+RpbQ91Xv/9lb3
         Vz3bk1MtBsUOob+szLK4q+WVpAkTFsUDieESdFSgF0DChumHz0e1xBPXglKunK01gSf2
         PBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZJD+rEJNtaXr4aYv3Xrq0HRqFXcFbI4z8IALC/W9CjfKs0dG7FQhjX5C3WboiUbbY8XFiZLpdf0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywui3LT5c4Y7Yd1kWsOJg5rgsw2zlIXfcToqMILOB7SO3Al0tnJ
	bmFaWkL5/5pGUDm865IWUl2VHhqoVxzqnTdXxfE3npWLZWQBf2uU
X-Gm-Gg: ASbGncthPAihvAxi3PwKNlYlv26YludDPB8d4WKry0ZGJGIcnDyMSXdBzbexRemolnk
	KcR93GDis8fNx3Wg0FjjbnfD9C4zVE2Wy1CRASbV8I8YyOkeaLawVBtQ3L9WkRw9gPVI7qmxXuA
	uzii5AkL4i/lgC4f7ooAq3lA98eq2dXiBFpp9a+1wk0FMgL7ie1MPnk42/8d5NhdEw5D6NEm+/I
	7YJQbiShRMyHVxITMB6qx9dqrUBjHGUU3x+fubB3y2jTCjDkiKdHcFWLW6onIV9cCLBdLW8UIm4
	3g+H3W+xrvTtxQkntIq40ZyuR1uxWwbUway1w5RkA8u0PzlqptIDrY0hhRTwyGvpa3azR14=
X-Google-Smtp-Source: AGHT+IGnNb2L5TPy8ZRk67DQoWNz3EnKr3D/3b81/wzKSzl4+H+Bebt+R4hGqZaj7Jkg168nL9a84w==
X-Received: by 2002:a17:90b:2e4b:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-306dd3247b3mr3471228a91.1.1744213526748;
        Wed, 09 Apr 2025 08:45:26 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:26 -0700 (PDT)
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
Subject: [PATCH v4 05/13] serial: max3100: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:48 +0800
Message-Id: <20250409154356.423512-6-visitorckw@gmail.com>
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
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f2dd83692b2c..36ed41eef7b1 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ parity_odd(c);
 	return parity;
 }
 
-- 
2.34.1

