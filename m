Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EED26A1DE
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213606; cv=none; b=LOXxhxRtcqQcWiBeHnT6zsic2eYOhjEP+bRHUG4KXzonuvBbPyPI3Rr0MsScnXd9Z5PqtwsJ7HsIzPFdEGzR4cO7yziQdQvBqi3UogBE07kuM01P3t0zyyphOzeibvx9WApTdcbpm+iCXdS2rBr53tLBHh1hhv3P9dZF7dKAEA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213606; c=relaxed/simple;
	bh=86K6PMYrG4Yc7WDoGSRLur+je0yhJ/i79zL8gF3HsR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k/mmnIeqWuNK42Z/Mu0Zye4JLv7zTwCnPYEugK6vwivW6LMOM0i+p3oOEebZjNsIUi3QGl/F3yQjLl5F/5BWeEu7qoY9057chP7A7irKdiLHbBjAl4E+2VU2ALiMkEukAF5Vfq32AcEyDfVzs81vEOb3OT9nIau7QHd6xS4zI0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCOphxhX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCOphxhX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so6140503a91.1
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213604; x=1744818404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BuIdzO9eB2TbumWIHS4Jh+TQPJAfCKqhpNNx8Z0il0=;
        b=NCOphxhX8hC9KV48P5VXhGV19hyI6PJLh0UwaQvv1kI5WV1wQ+beO7NwN2wSgwUGBs
         A+JPvM6Z4Edooakd5CGmx5+3uVUJy+vQFZgSpZgrFqN8aPFvqZFFKzc/cZnofN9JyfDv
         XyYGWuPmjYcHsXvO8GN24eoIuVtzdvBvfo317xnCxpQRtCnujDa3IxAoh773AgmszcB8
         jFxvvWWgt6RtBokH7ZlTNZDQPydX+1YU0NsDVoWUgbyOP7NR9aLZTCPZNSvwQaKUTuK+
         y/m7bJR4A2OUPXPgD8DhXknG9nGOq0VUNwPQHJ2tWl6kY6sSWmBIUX9mkQw/ryQXJhFX
         4APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213604; x=1744818404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BuIdzO9eB2TbumWIHS4Jh+TQPJAfCKqhpNNx8Z0il0=;
        b=SPxVZkyb/JuA8I+FaK89T3VRxxqI5OBDw8M9CQh9NJ/pevJNgNzV9ZnmZpU/n3Rq9y
         NReJM5wWeRJU6rqiX3EtKSDcHIlUyef6WaDeJNJVuY3aJrQW7PtFhVpbFZHAz6MSqGaR
         yUfwQBJbfQc8HKNE1L14aITk2pj1Ns9gLX950jOGPg0nxVVbn6LR35LAUSRzpixkXgrW
         n21nsfUUXikHtq7EFKAZa/61X0NqrsctqE8B7T6D1MkNVylbB5IoPoSCp0JzL+MK/MkK
         unCu72vzAzLuiDeYA4qPL0n8u+N7EABnZadMdHdof9JUzq9bNvZBXO2P1tzggfvmZfB+
         WJrg==
X-Forwarded-Encrypted: i=1; AJvYcCV/CddG3JSgumeYLzo6NLQU5ReooGQfRAdo+T7aVQAHXP/cj4WCDMKYBzYcicwuG1o/DO5LQuEPMps=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcMqkTpLvoZpzj458mHjDElZZha5FS5BNzM2rwdIBzBU5yrD7Y
	DooK0dkXhOboUSaQ7XUcS+pgmpCAxUAinE9NpqeLhKDrSTgZ/de+
X-Gm-Gg: ASbGncvOALJvrUBuXI/+pbEikMoXKsu2j663H55P21hMxQp/aq83rtU/uDZcRf7e1qx
	Il7A35zVk1t0pR06kHz3YfI+3o6ezWONUZAXrXie+JdYnUcJUONBsKWfiobqcVaGf7TQnLfipXJ
	CD22rM7qsDOsP/xffWpwYqN26U2YhnfTu0JJmyphDZ1DsNied067uxnUwfZHDV/85h6msJzHdGw
	EiJuxWnmkeHWRA7b3f4DeVwa4igCuVPhgdyuiu4l6m/AUtCqY3/Y8lLh0AtEuea1OobAKHUHNoo
	coTRSUpZ6hrxkXOyDt8OfUn8jaljmfqgjtdOggcmhvusx+IocfYIVgb/g3vQduBqbsFw2h0=
X-Google-Smtp-Source: AGHT+IHJFVNSWnOegw3VgIiiuGFrSpWrUrgalLTX98dIPQMejjp36YTfz+PTZSsEbZDfgQmuBjYI5A==
X-Received: by 2002:a17:90b:2b8e:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-306dba636c9mr5272799a91.0.1744213603675;
        Wed, 09 Apr 2025 08:46:43 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:43 -0700 (PDT)
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
Subject: [PATCH v4 11/13] mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:54 +0800
Message-Id: <20250409154356.423512-12-visitorckw@gmail.com>
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
 drivers/mtd/ssfdc.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..0db4776424d0 100644
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
+			if (parity_odd(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1

