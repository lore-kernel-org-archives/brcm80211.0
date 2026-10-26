Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993074;
	b=y6sAhOPwtYtavFeJp6CA2F4FghiSZb/4Q2iB1VyB/Rf7k+AZ1kEEjPimTxpHHvya6qZ8
	 zIdzJKmqceyWBn8sWCk2fbSCEmqnnudeeDHDyv4WREgr66NAE+KROqcoYfG55kMX7RUrq
	 wFd8isq67KbLEoyWyyk01Ezm+kQyvUSMimxl7w1gRS3qs3MA/e8Tw61jyz6gkdUKlXnhB
	 knqSHmv9bzXopOokUE2x8FZMmByN9rieJJ/+kiwG8A6qqL0zI3A43WTLb53D7IF6jiecZ
	 zqbZiP3J/LOfULNkb6IMB5uPqD3xKEzKd2aO5sIoGXb4WQsz1HlXhMWDyuSza6lhgSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ILgCWsWfIgmMiDb4TrI2KyIgydeoYhhsJJxEpH1dAE0=;
	b=r3brKieTxps4H78m8i5dLhVJsxf+XXQyZIWYw2rCyKyQY/Eq6DYtlzBhWPXapXz3nZLr
	 kCKBVdGZrHB46yPT22KcfwLpHUba5ygzx09O8emYMM+TTTA+1siJYvTqI9qaYlpmvpmE9
	 DboevEe6Godrr6mHmYRuiaSpVEzxZO+aAei7/aZzqDUkpuBfECu6FXpKBJ8EQPqeh9ZgA
	 0w2I7oRJNsUxtep54nZzSqCUDgCfLoeCJUWql04Au3ZS+2bHpMnra4e6fyR5QOV+DDlbo
	 Eai3rooliy79rV+2adRM8pZKfSs5GKomeRNbSGadWzeYmZEnLAb6B56uORRlM8g++Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="GZUa6/M9";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3346460A6F77
	for <brcm80211@lists.linux.dev>; Mon, 26 Oct 2026 05:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3346460A6F77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZUa6/M9
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06210b29fso902542b3a.1
        for <brcm80211@lists.linux.dev>; Sun, 25 Oct 2026 22:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993073; x=1793597873; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ILgCWsWfIgmMiDb4TrI2KyIgydeoYhhsJJxEpH1dAE0=;
        b=GZUa6/M9cPOXiAxdTFL1VzH/ZPDBdZdcsiYTBV9Z9tyinsm+gY++klt++5+CvHApjV
         oAFXVWPZyC3slZtZ1EsKcXO7uFpyuG2ykQQQhAZkwO0f9TGWija0uzjUo7jC9rhlIyFR
         dfHJY9x6MCi+mUSX7ywR7riLdb1dgO4r97oGI0o/2LgSoQK2a5Kv/1Fe8ghztglkPRwU
         IqaZLtH76c+9NeDn0C9hIUf+uHjNPzHmsu4E0Pg27Dr+w8CDhHyKGI7jMS1tDrY8YOJP
         oulZqjS3UdyXaAHteX7nlaHA3aeMPjOCZJWmgGU1n6W4BzRlWYmQirrtgAJ1ZK3d4uaw
         Vz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993073; x=1793597873;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILgCWsWfIgmMiDb4TrI2KyIgydeoYhhsJJxEpH1dAE0=;
        b=iP/ibPM/daos8jyDMS+/F3V+tutRcrn//05rbTITl681kQPu/DhPm3g03C50xHYDv9
         QkMilYLMvQlvj/xpPtfRaT9pL3dWUGLAVlUMcc3JgilFGwfkDm9yEwtJmw4FiSuyRy6j
         Vi0+4u6lBA4w+K/9BjMBz5XWqwFEivT5eNrPdKxlQhZ4hSvdceuaXWFUM/pJHLU3/TJX
         pDrKMzs7IQv2ltxYqDh65ykvfZZ9V2TA3IiEL0aaWbr3EwXlxpoVAiioTSxyrrl05mZD
         y3TIl/azEEgo2vfM2HPPP9AmQvjE1XLD7P2KgirBrkkEKnaZN5Vs2mH82K6bE+UJEZLb
         DtVg==
X-Forwarded-Encrypted: i=1; AKwUvBwRTRvqHESHFk8RziiZHpkygPXxsLBu+0BOi5Q+tel0ebv/MJYCjvWWLXSaDUZHdi/geN8SmE9EDfU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKBJWrRcTn3kOSzxXguobqzs5xe+OpSNVBhYm1HsGdNED2n7TXr
	zvdNdgntZ582G9Q6YFHa0lj1APBN9PMUVvNWhYPK4wE1b05/FgMVIBDH
X-Gm-Gg: AYBFou385cSGi8lqg6/QqZrriMFziJmFSLmb/+WBR2NYlHLSZCFVyOYApnGINL8G4m6
	GcRkaKFntnF9AE8KNiL0jYoB1C6iOCquf4h3a6NA5tizkA90wNUQoI5KFLM67DOlews7OR2GLZZ
	oqE1E9GWxN9ZEnA+cuAf29d/Cgkp7hE2nwBU/R2FIZppXvIVpxL2ADMiCBsvMo/hEE1N4WM6ad0
	LQbBQEBXWsEAAPftor4ttv+mdz1HsyWdXhbotk3PY3XezpPrgxmvNaMxcbTbb33afow+kfbre0R
	zqd4FzpPGfGDzWWzHhg6vqLDQMpzkI6OMXhs9MdUZzOGIS7AsRpScWgFNpt560vADkInsW6pjuk
	TAdZSoFdl44HFldEU7q1PAAGZvZavD6tiRmoKJmn26rbU6tr8+VjpPnxjrciSAAsp8ogRkZtTld
	MzN23ZlZjtS9zJ3NJzVXEZho4+yygQoFl5cfNpTFHyvNJdzJsu3/1MZjIkjjmyxHBlxIhgeK/17
	e06HW3AkOkj5YKKhtjOvOSKA8hCj1Z2joA7QBEsmcykqxg9+9GjuMXHRJ7AlOk/XO/HD2w0ilWA
	5KOq
X-Received: by 2002:a05:6a00:1808:b0:87d:ee98:606 with SMTP id d2e1a72fcca58-8a367f0eb74mr4354231b3a.23.1792993073630;
        Sun, 25 Oct 2026 22:37:53 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:37:53 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [RFC PATCH wireless-next 17/17] wifi: bcm4323x: add Kconfig, Makefile and MAINTAINERS entry
Date: Mon, 26 Oct 2026 13:36:23 +0800
Message-ID: <20261026053633.361454-18-ragulbaby@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Wire up the driver so that it can be built

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 MAINTAINERS                                          |  7 +++++++
 drivers/net/wireless/broadcom/brcm80211/Kconfig      |  1 +
 drivers/net/wireless/broadcom/brcm80211/Makefile     |  1 +
 .../net/wireless/broadcom/brcm80211/bcm4323x/Kconfig | 12 ++++++++++++
 .../wireless/broadcom/brcm80211/bcm4323x/Makefile    |  6 ++++++
 5 files changed, 27 insertions(+)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/bcm4323x/Kconfig
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/bcm4323x/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 733660095..91f4eef9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5210,6 +5210,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
 F:	drivers/media/platform/broadcom/bcm2835-unicam*
 
+BROADCOM BCM4323X USB WIRELESS DRIVER
+M:	Ragul Balaji <ragulbaby@gmail.com>
+R:	Ho Jie Feng <hjf3108@gmail.com>
+L:	linux-wireless@vger.kernel.org
+S:	Maintained
+F:	drivers/net/wireless/broadcom/brcm80211/bcm4323x/
+
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
 M:	Rafał Miłecki <zajec5@gmail.com>
diff --git a/drivers/net/wireless/broadcom/brcm80211/Kconfig b/drivers/net/wireless/broadcom/brcm80211/Kconfig
index 19d0c003f..e363ebdd5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/Kconfig
+++ b/drivers/net/wireless/broadcom/brcm80211/Kconfig
@@ -23,6 +23,7 @@ config BRCMSMAC_LEDS
 	  is enabled and reachable from the driver module.
 
 source "drivers/net/wireless/broadcom/brcm80211/brcmfmac/Kconfig"
+source "drivers/net/wireless/broadcom/brcm80211/bcm4323x/Kconfig"
 
 config BRCM_TRACING
 	bool "Broadcom device tracing"
diff --git a/drivers/net/wireless/broadcom/brcm80211/Makefile b/drivers/net/wireless/broadcom/brcm80211/Makefile
index 88115d072..4d0dc67e6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/Makefile
@@ -11,3 +11,4 @@ subdir-ccflags-$(CONFIG_BRCMDBG)	+= -DDEBUG
 obj-$(CONFIG_BRCMUTIL)	+= brcmutil/
 obj-$(CONFIG_BRCMFMAC)	+= brcmfmac/
 obj-$(CONFIG_BRCMSMAC)	+= brcmsmac/
+obj-$(CONFIG_BCM4323X)	+= bcm4323x/
diff --git a/drivers/net/wireless/broadcom/brcm80211/bcm4323x/Kconfig b/drivers/net/wireless/broadcom/brcm80211/bcm4323x/Kconfig
new file mode 100644
index 000000000..0015893f9
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/bcm4323x/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config BCM4323X
+	tristate "Broadcom BCM4323x USB support"
+	depends on MAC80211 && USB && INPUT
+	select BRCMUTIL
+	select FW_LOADER
+	help
+	  Support for the Broadcom BCM43231 and BCM4323 USB wireless adapters
+	  used in the Netgear WNA3100 and WNDA3100v2 and the Belkin F9L1101.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called bcm4323x.
diff --git a/drivers/net/wireless/broadcom/brcm80211/bcm4323x/Makefile b/drivers/net/wireless/broadcom/brcm80211/bcm4323x/Makefile
new file mode 100644
index 000000000..406cc8fad
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/bcm4323x/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+ccflags-y += -I $(src)/../include
+
+obj-$(CONFIG_BCM4323X) += bcm4323x.o
+bcm4323x-y := bcm4323x_core.o bcm4323x_mac.o bcm4323x_tx.o bcm4323x_rx.o
+bcm4323x-$(CONFIG_MAC80211_LEDS) += bcm4323x_led.o
-- 
2.53.0

