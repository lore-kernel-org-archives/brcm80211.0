Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993043;
	b=cP3goQf8qAAI/65Xwj0sub5yWpkufmlbm6cCj8TPwppjateu2BkWs9sl8kyxlAwwrHht
	 Iz5X5efvhOZi6AI7cQ4NSq9PpqPIL0KJVPBfAC3pplii6nSkZsNVrV0BKvnKd/S7jmLDx
	 ef9MB8BQXMxIVhtp0pFQJXy3mSb3Do9M3x9m6ZQK8bJ3UjSKwizRwdrA9jnyLWzVMH54f
	 C1V+wUrP5s7BHdDHyQ0XpnjaHRu3OQrE05AccWD/thIbexOGoVpENLqtSJyw//im2S8rA
	 KVdEuHCaSVohuuZSflSnPA5QrLp79a/3EXfjPK9dXd3LzzxUgtHyZyTeZ8CBlwy3LWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZTaBGOKPSVOoy0RZ3YHBJw6ahpIeIXPfnYZWqJHFJMY=;
	b=p2JIYRdxJCbTn/PutoXuybFsfn2HCCVK+jMZcNFbDu8DNdzgACsqBYHPUPQ0fERpEKfR
	 upBYLSEzTwG7P1dSC1lee4dzdNuJnSU8D6iyTDNBvUrVB2wAPeZW867ol481rHgbeWk/U
	 TowY1dRpXPQ4grhL0hGAMmamy8iR9KWSpHWJeUMpcMC5pMYYfTbfLzS6EkdGIhfDQ/N2U
	 elRNmS/QjIrxN7no0HLNl4LpCiEH7eXsXD4ArmCiOtQbmn+/uqcP372F9D2hct9RlpKPa
	 cyLJbSSbjhMzF+ZD3OJ7fogWJPLc1m4FNqPHW2vWM7NVq5QI1iF+voAhmvEQwJqsQKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cyAcsvau;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645060A2608
	for <brcm80211@lists.linux.dev>; Mon, 26 Oct 2026 05:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0645060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cyAcsvau
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a089dfee18so1797815b3a.1
        for <brcm80211@lists.linux.dev>; Sun, 25 Oct 2026 22:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993042; x=1793597842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTaBGOKPSVOoy0RZ3YHBJw6ahpIeIXPfnYZWqJHFJMY=;
        b=cyAcsvauU2XgjYCUEdLTL4Y1xN3+ihoB0JTJYmqwlf5s/UjpzK0s9M+7mPXTedTx1G
         17fwZzTzW/abILwRoF7l7YDs/yM3U1tRDdYoz/KQtJijAoRHh/K82vJEXH/mTYJ/6AYO
         PPcpePYmUW8jigeZz29eVasn4aWf1wI7QjW9gQ2VzgO+GkS2veyPVqwVajaeAZojWtP2
         Aknb5eqNM3P0KEDHudXAsJrdIl8XLrbqhXjvNynWUhM9Z/snxwb+4rDqfLN6Zukn15Hb
         JP3Ss/M+GPPh1Fudt3XtcWKgJbezYujYHTjal3coVu7sOT9lpgiMcHtw4OmUfdrgGBQF
         OOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993042; x=1793597842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZTaBGOKPSVOoy0RZ3YHBJw6ahpIeIXPfnYZWqJHFJMY=;
        b=Fv9YlB0mk7dFE9dlPrrSLNuK8LPABYnFcMbL2btTsmm4oFPiWM3xoLamxrHX4Der7S
         PyHt75pPhn13CJyDElkamhB5i/1bm58BK3FWhQk2DTeejX1E24x0MxhLkAvnzu4/YrKR
         BHSNsA+wXn8O1wG0CjwnLvNi9Pb1II6UB0R0etxqL8J9JE2LfJ8JLaS2ECZboYWuhOzt
         xlbOC3UJ2w5BTWAM4q9r/Ki/dTNP+Eu/Y9gpc/DeXPrUTGW8SzGq1LeEmjxNsSg64jGY
         AN45OIsU5HfLU2Y5sObxZyzb6LIUcJQiZpMb6YiObnNihSuFregn/wC9oBk3bE1G2Bls
         n1gw==
X-Forwarded-Encrypted: i=1; AKwUvByy+wA35OHsbEJhSt5B7IeIy2eXyfs+KFAj5JGmpt60vkXn32jJ4rqAd+49b1cFPy/9ygc6//YBdh4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJMgvF07u4sUVmHlG/xXx5mcZv5avEmZuMsSbpbw8lhhMFh8Aj9
	CQsgqlbgcX0W5fN5090GMSplMwqZS0js5WZaapw/nbjAIn7RBat554aD
X-Gm-Gg: AYBFou3wrrsTWha9javWo9TaRIc3LrWLfRGJnlL3C7k9utER7geTbhYOJ46rAQyRTyl
	hINWV9qxWsovSbAi03qT9E/RU2+bFXrdXJ2TRYCtdVJIsIh5LFvM54/bOhNmSlgIIdDD5ad9nvA
	V1PGpKRMQxgoB0OdQv0aEWJVmEgx305sqgeSs1hAj2siXuTKvBfzFFMSR0wImmS2XgA/Qvgt9t2
	uQz+feTPIv4dE2ZkqizoVeyZEb5JQ1LD0UaNh+0BwOYJOXcjsBrzfSce6JWqIA5A01iVtr6iPky
	E1GgaecUgujx2H9/j9x9JPm44fnJDVMQJfr5ONVh2z4fEP0DL6lZA1mAfXd8ecPQj8rpW0UySW8
	+nDxcMsAj6ldN75PF+POXfvv2CLs1Wpszj8Wu7RqP1qN+8pbYBloKX/QGTwmy/5Yuz0yhLgD5Av
	ol6Abpi9/54vueQ+S0pDVblGRC+hYMId1h44nQF4kVNLV/zRruuYYeqFtgjsxNoA1PTACQp9JJA
	DGOkZJA2iBr2DDw5SerS7EyE4vO2xvmuA31bnMDSjsNmX9VSMLttYsXtcBBc01lvQ8ZSBHv4emo
	H8kg
X-Received: by 2002:a05:6a00:4092:b0:898:3e:3101 with SMTP id d2e1a72fcca58-8a366e6ee2cmr3141056b3a.31.1792993042332;
        Sun, 25 Oct 2026 22:37:22 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:37:22 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [RFC PATCH wireless-next 09/17] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Mon, 26 Oct 2026 13:36:15 +0800
Message-ID: <20261026053633.361454-10-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Broadcom USB bootloader downloads firmware the same way for other
USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
firmware header and response layouts from brcmfmac's usb.c to a header
in the shared include directory, so that other drivers can use them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/usb.c         | 68 +---------------
 .../broadcom/brcm80211/include/brcm_usb_rdl.h | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+), 67 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
index b41949a9b..e48f06468 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
@@ -12,6 +12,7 @@
 #include <brcmu_utils.h>
 #include <brcm_hw_ids.h>
 #include <brcmu_wifi.h>
+#include <brcm_usb_rdl.h>
 #include "bus.h"
 #include "debug.h"
 #include "firmware.h"
@@ -26,8 +27,6 @@
 #define BRCMF_USB_RESET_GETVER_SPINWAIT	100	/* in unit of ms */
 #define BRCMF_USB_RESET_GETVER_LOOP_CNT	10
 
-#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
-						   has boot up */
 #define BRCMF_USB_NRXQ			50
 #define BRCMF_USB_NTXQ			50
 
@@ -52,71 +51,6 @@ static const struct brcmf_firmware_mapping brcmf_usb_fwnames[] = {
 	BRCMF_FW_ENTRY(CY_CC_4373_CHIP_ID, 0xFFFFFFFF, 4373)
 };
 
-#define TRX_MAGIC		0x30524448	/* "HDR0" */
-#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
-#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
-#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
-#define TRX_OFFSETS_DLFWLEN_IDX	0
-
-/* Control messages: bRequest values */
-#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
-#define DL_CHECK_CRC	1	/* currently unused */
-#define DL_GO		2	/* execute downloaded image */
-#define DL_START	3	/* initialize dl state */
-#define DL_REBOOT	4	/* reboot the device in 2 seconds */
-#define DL_GETVER	5	/* returns the bootrom_id_t struct */
-#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
-				 * event to occur in 2 seconds.  It is the
-				 * responsibility of the downloaded code to
-				 * clear this event
-				 */
-#define DL_EXEC		7	/* jump to a supplied address */
-#define DL_RESETCFG	8	/* To support single enum on dongle
-				 * - Not used by bootloader
-				 */
-#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
-				 * if resp unavailable
-				 */
-
-/* states */
-#define DL_WAITING	0	/* waiting to rx first pkt */
-#define DL_READY	1	/* hdr was good, waiting for more of the
-				 * compressed image
-				 */
-#define DL_BAD_HDR	2	/* hdr was corrupted */
-#define DL_BAD_CRC	3	/* compressed image was corrupted */
-#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
-#define DL_START_FAIL	5	/* failed to initialize correctly */
-#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
-				 * value
-				 */
-#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
-
-
-struct trx_header_le {
-	__le32 magic;		/* "HDR0" */
-	__le32 len;		/* Length of file including header */
-	__le32 crc32;		/* CRC from flag_version to end of file */
-	__le32 flag_version;	/* 0:15 flags, 16:31 version */
-	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
-					 * header
-					 */
-};
-
-struct rdl_state_le {
-	__le32 state;
-	__le32 bytes;
-};
-
-struct bootrom_id_le {
-	__le32 chip;		/* Chip id */
-	__le32 chiprev;		/* Chip rev */
-	__le32 ramsize;		/* Size of  RAM */
-	__le32 remapbase;	/* Current remap base address */
-	__le32 boardtype;	/* Type of board */
-	__le32 boardrev;	/* Board revision */
-};
-
 struct brcmf_usbdev_info {
 	struct brcmf_usbdev bus_pub; /* MUST BE FIRST */
 	spinlock_t qlock;
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
new file mode 100644
index 000000000..cf8492a55
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2011 Broadcom Corporation
+ */
+
+#ifndef	_BRCM_USB_RDL_H_
+#define	_BRCM_USB_RDL_H_
+
+#include <linux/types.h>
+
+#define BRCMF_POSTBOOT_ID	0xA123  /* ID to detect if dongle has boot up */
+
+#define TRX_MAGIC		0x30524448	/* "HDR0" */
+#define TRX_MAX_OFFSET		3		/* Max number of file offsets */
+#define TRX_UNCOMP_IMAGE	0x20		/* Trx holds uncompressed img */
+#define TRX_RDL_CHUNK		1500		/* size of each dl transfer */
+#define TRX_OFFSETS_DLFWLEN_IDX	0
+
+/* Control messages: bRequest values */
+#define DL_GETSTATE	0	/* returns the rdl_state_t struct */
+#define DL_CHECK_CRC	1	/* currently unused */
+#define DL_GO		2	/* execute downloaded image */
+#define DL_START	3	/* initialize dl state */
+#define DL_REBOOT	4	/* reboot the device in 2 seconds */
+#define DL_GETVER	5	/* returns the bootrom_id_t struct */
+#define DL_GO_PROTECTED	6	/* execute the downloaded code and set reset
+				 * event to occur in 2 seconds.  It is the
+				 * responsibility of the downloaded code to
+				 * clear this event
+				 */
+#define DL_EXEC		7	/* jump to a supplied address */
+#define DL_RESETCFG	8	/* To support single enum on dongle
+				 * - Not used by bootloader
+				 */
+#define DL_DEFER_RESP_OK 9	/* Potentially defer the response to setup
+				 * if resp unavailable
+				 */
+
+/* states */
+#define DL_WAITING	0	/* waiting to rx first pkt */
+#define DL_READY	1	/* hdr was good, waiting for more of the
+				 * compressed image
+				 */
+#define DL_BAD_HDR	2	/* hdr was corrupted */
+#define DL_BAD_CRC	3	/* compressed image was corrupted */
+#define DL_RUNNABLE	4	/* download was successful,waiting for go cmd */
+#define DL_START_FAIL	5	/* failed to initialize correctly */
+#define DL_NVRAM_TOOBIG	6	/* host specified nvram data exceeds DL_NVRAM
+				 * value
+				 */
+#define DL_IMAGE_TOOBIG	7	/* firmware image too big */
+
+struct trx_header_le {
+	__le32 magic;		/* "HDR0" */
+	__le32 len;		/* Length of file including header */
+	__le32 crc32;		/* CRC from flag_version to end of file */
+	__le32 flag_version;	/* 0:15 flags, 16:31 version */
+	__le32 offsets[TRX_MAX_OFFSET];	/* Offsets of partitions from start of
+					 * header
+					 */
+};
+
+struct rdl_state_le {
+	__le32 state;
+	__le32 bytes;
+};
+
+struct bootrom_id_le {
+	__le32 chip;		/* Chip id */
+	__le32 chiprev;		/* Chip rev */
+	__le32 ramsize;		/* Size of  RAM */
+	__le32 remapbase;	/* Current remap base address */
+	__le32 boardtype;	/* Type of board */
+	__le32 boardrev;	/* Board revision */
+};
+
+#endif /* _BRCM_USB_RDL_H_ */
-- 
2.53.0

