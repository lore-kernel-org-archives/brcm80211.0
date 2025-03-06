Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B1321B9F4
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278479; cv=none; b=sN2lXMy11EKi05xzdTbEbkVIkz9V04opOytrpbS19mcgDF5MSCk9alhPhgOUlgiA/y3lTnjPjtpJbKLBbK7bvkBTNMGCsD7X6Igc2z95QA8QcziBfBzsNYAbhF2PUHxzKFrsT2PrieEiVqwsGvnGpdiayKzy7c6ATWsBYWVztLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278479; c=relaxed/simple;
	bh=QiMst4KG8nw5lbncH+WStoqZ0M1Swh/bMRY1iwVqAwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TinAK7Yw95ZGnTmFfA8nMRNEagkpXUkRJutwSt19xC70dT2Q9ul7+x6BMHQgO7cDGGoOuTjsybZgaRoJG0gs6YgfQ9a/iWoVs6in4tEVTEIRujCbwjyIkpnvLrs7IsIu/AjkkYb/2tcopMfa5Ko2LuvFMRaVjONa2wv2fsa9nFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oor0wYih; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oor0wYih"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2089726a91.0
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278477; x=1741883277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAZ6yehSc4MEYrK/rteyLhLjWQGTSbLYrKbJr1roEME=;
        b=Oor0wYihVeKnghQrMOPz4w4fluHHyqrOVIPHVeHgh+wW3ERLk4AvdzYOmWAlRWeoiZ
         Nn3UwmfLCTvdr8Mdni/ZJI3l3lftcExcANVX24u+IA5ZmqLHbr+G8N0rHIamCeI3WFCB
         RQdFFw+CxkF6K/cykzWwxf7e0pelgdeZlDF9wWnNnqHEjqwEROgqO4xXJ/XBrMTkt90u
         ZH2u4L7K6ocYg8FVgT8USCXRk3qLKDOyZRIs0BY9u+0tSMLth8uX2O2NyrW0oNtjCAYL
         AGTHZH0dIwWDYvrUX6c2G3RvuOQ0OnEayXD8qx8R4SRWCTaIdMg1NAFhxEZ4sUf+9l27
         5crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278477; x=1741883277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAZ6yehSc4MEYrK/rteyLhLjWQGTSbLYrKbJr1roEME=;
        b=PZcBZdv0lULVJTTC7vIyQzMiJA1d+L+jnIag5lhKovgjd2+jTpMDj8wcdeTmMczrm5
         r+FKqHR2b9AzJLMxGjY4xuhQ0sL4pSDtm9P7yRgfUL//WLSZejJZeb1G1lMeSD9jLauP
         wIFE2v6K3GUNm7fjpAjQFuJuXHdWaqgTWdXdpnxFE6IbiqajorP8+9SW2VF+/lN6zgPf
         XiAYqvKibqrkxHbX2yS3Lnce+8O9S37u2iR4CebSzyURJPfzLaxMaNCeWzha6CPoqEFQ
         yX/NKVfslCUYiwy5n3MnjmJ/sdEteVL9TpqM8oP/QRjYqLFh1cbAlDatx8LMCeeLabQR
         knfg==
X-Forwarded-Encrypted: i=1; AJvYcCVjlm8mBtbzlDjbRqlVfWaxIUNxluTZamqh73Gn6xJSQpsXbdYr32nInM9wnRb8KPOKvJ2VKpnyC+w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJgFT9YYeYrunBUqX0T0gcJ7eXRXa7NDIcQaTCmwN4r4QJhq/H
	WlCO2Ei6xGBE9H+IxCvR5aQbNpOWAfOgjmWDnSaQHBZayqqTzYUF
X-Gm-Gg: ASbGncv1BoCEmjh/rpQaMiQrvKW/dRFQPLDswD/cfs9HtB9QNdwuuK/pWwvZYL8Gij6
	FCCZ9Kx0ZXif8STifYCLAhGQHzEgb/5HZUQk0GVoG24C4ZIv1OV7SgUv3Dou5KcuWvR/hKJgt7E
	BR2Ao+gaN09uWVdVXvYDCU6Fu+ThTTkoDXdCuHphBetACznQZrMoYVXpazqArt0XQjTQOCaX686
	rPL3JFb7nXj+FLjZJS/iaY5gyLrZkmgC5AtIbQGUNXY0l7Ip1XvQtjt7IwqtdLSSNb/PwtMGzyz
	XIUErqZrNp7QNnUxTqqKLQ6zRAfZ3Jmrw4Rk+OXqCkxM7/KZMRnVkDEJhZ2vXVomOlBmDA+CVCA
	=
X-Google-Smtp-Source: AGHT+IGSTp6IoXEU2YpG6BXR34TKK6tsBmlfHVAOxv0eBhCn0t3RdyPBa0hZZRnTXXw4e83qNulrtA==
X-Received: by 2002:a17:90a:e707:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-2ff618003c5mr6206329a91.17.1741278477310;
        Thu, 06 Mar 2025 08:27:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:56 -0800 (PST)
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
Subject: [PATCH v3 12/16] mtd: ssfdc: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:37 +0800
Message-Id: <20250306162541.2633025-13-visitorckw@gmail.com>
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
- Change variable 'parity' type from int to bool.

 drivers/mtd/ssfdc.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..53a72576a646 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,24 +179,11 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
-	int block_address, parity;
+	int block_address;
+	bool parity;
 	int offset[2] = {6, 11}; /* offset of the 2 address fields within OOB */
 	int j;
 	int ok = 0;
@@ -215,7 +203,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity32(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1

