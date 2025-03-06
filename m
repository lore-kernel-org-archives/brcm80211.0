Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711FE2417E4
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278488; cv=none; b=ZfdPge95/68iAI8mNLFUzU3P2/VX7p0FAK9+eman+4l6Jr3v8vqX1/k+MQ72v48mVtflyl37p29+eb7g1BYuL1zv2LgmWpJQgw3oZHehfJF4o0N0VrQIDgr9nshuzmuxlgnIroDDMK/MYHRBcIEFSYa16huszZCh9712v6u+EgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278488; c=relaxed/simple;
	bh=Qq1cropLpjjfwJogO3hvfUuoIiyYZmalJxfQDmrzPKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I2JIgX/z4BTdN9zhU3VtQxyNSiKbstWWwsJ2wikpKTLmOxpOJjziFL8HzUB2jQv7mbFH35y1RAb+zsUqVUVZbYLRe/+cR+6aX3DodShRMDEwlUblyvdL8wO3FEiOGsY9XCIeQ89z+HIdG5N4pBKTZAbFmWIcH2a6KWx0f2YyM2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN305XEb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN305XEb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso1373748a91.3
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278487; x=1741883287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVzC5eNDjiMbvhvqlOK1r/73KNx64ddnKPcxwil96xE=;
        b=WN305XEb5K2RYDvedZH0cwBSyMpBWkW93sAW/CxpV2JmoFxnt9S/ZRzIPQkWqW/WvD
         kcmJ6VnSwNjUcJr9mFc2TPLvg1YElRHHbeq0mS3V4M4JuoGtoWwSMtvPrIEsn4MCR9J8
         w+tvAQO7qrvdvym17CmZ0wOgeIBAETQZjtTfzgThRiG3WcDQ3xR2ikfbZmGIdeXYv4vH
         /tRMX2DIvQozfJ+4YlHjDpKUHy8n2zRzccBp2+ZGmKXncK5zwMNAgg0sh24rr2C9fMRn
         qBbgeelvFZzfpE6Mh6JJG1KZRR/oOixn011NtoFjaITSCYvaOpawoXeSrDIHN66YmbSC
         1QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278487; x=1741883287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVzC5eNDjiMbvhvqlOK1r/73KNx64ddnKPcxwil96xE=;
        b=noCfO1JEL0zDrFlKpX+JOzAKkR7zMxFm0p1UwIhV2RURr8djOpp1tHRjvjOIVgKC3d
         JIBl62y5NENHLfT1hEQV03RrRSH4n4RpgpKXNa7t6RqH6SUqCCPDccy7upm8LJ0SpCYq
         WegYH6+CgWxxweUV8NWCbVXAeMYkz8H8j1OuL7Plf7uXsLvRsy24vOF2H41McIZ8ex3Z
         Jhc6kMNV1NEamuBh7Gd5+l1cQFhmfYdYrB6lOLRSKi8bxYNB+ViLzh46YnJKY0cp6fRs
         ZmPGrDveIjgK/65P0/6qisET0ZX0zN0TYEkkx3MqBS94XVfraTMS9lPzXqLCR/49kcWB
         tE7A==
X-Forwarded-Encrypted: i=1; AJvYcCX0sNyrde3wKNcD4kuuPTwqI2N1OkqX6UwhNo9y4xL/PDrqhc7nM4AJSwiCOTJnHhex0fa9jiw9L9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yym+qgYrFGPD0OKgMd9+GlBljTrweUb1BaaRqD6YiP3r1bozMG1
	J524VnXu9hbn4JPyoxsysdothAZVE5C9RRVU6OFJ5qviLbUuU1qt
X-Gm-Gg: ASbGncvtGbeDcha2qMIcuzB75BTOVIKrrnzsZDkWqHVfKQqI2iWIe369DTPw9UAhopN
	i/3APMhfFAXDw2BeBC5WZBJDkb5AOJevKe8wGywtVkzuLovsyalKYDrLsa5A1UfojIBKeFdvoPh
	hIR9XCA3+6x4sOqVmDCtnVGH2mSlJPPV8EaYkuXYad4tzbwElI40VHxZNFC+/N2PvoVopgCPh2S
	BNMQyt4OcDEXLRWJWCye1+3yV8tzs2yCNQr9og2HAIxv5QvMw5UnZpbDioywDwDJhpy0oC3cLxH
	D3bSWjiREsmvx0/owNhD29XvkmKljOY5e5IPtxtL9cZDDjQdsdAjfstFdMe8Ln8XyNVz4vzdoXA
	=
X-Google-Smtp-Source: AGHT+IG1hUiIY04WmIWjSTraivZtBZJVGW/maYZ4w8gjs57Y/NbYWELqgVEzi3PK9/fk5EW05X3DDQ==
X-Received: by 2002:a17:90a:c108:b0:2ff:5357:1c7e with SMTP id 98e67ed59e1d1-2ff53571ccbmr8979955a91.20.1741278486674;
        Thu, 06 Mar 2025 08:28:06 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:06 -0800 (PST)
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
Subject: [PATCH v3 13/16] fsi: i2cr: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:38 +0800
Message-Id: <20250306162541.2633025-14-visitorckw@gmail.com>
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
- Change parity ^= parity32(v) to parity != parity32(v).

 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..46511236bbca 100644
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
+	return parity != parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1

