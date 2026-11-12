Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460325;
	b=bv+MdTd5gMlnnf7mnZhZgr+KV5KJO3s8ESbf7K+rEJh4pU6FRzQo2nB9rdV9kSBfk1xy
	 1PWGdzlrULh3vB5sj5/4Wlj13NsA+eK11r3NdZrJeQ6ms7awxQ266T74GPb43kX9TR+dR
	 8WVILQiRJ+m2MdzPKHbh4ALDRt3fMIZ9VWWW3J/LeqY2HjRvSM90XXsBbLpvEuu8+FIPI
	 zdcPEHgKhExyp8vTqi86irJCeweV4TmAhzG2WxTd35qqvb1nud3sv8+dfgVnPvymo0Bzs
	 EAzlhmxzzdLRZ/7zQOHDfBwf9wfpmOPrr/vHsEBI58dm0ky4wyiWr1O5Teqf/9qkkIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
	b=q4gmxgEN7wJfV+TF7TJpykm6G8uFg/Jm959wkdS+d/eE9BHdWRo08ur47uc1m7Gbnvzq
	 hiKG9j6hISJQuZrl82tt9Lh/JRVdPXOTgmszvK9IdzH3tRDSvHSg2x3BKAbP6oE5rbv9R
	 PlIHUOhuhZkgoPfzAZfjulsEQ2bcKB3LRA/gHD9aietgDAuzQ4y3Ye+Atob5wdnkr8Pq3
	 h3vqaWXoDVbcxd9EyWrNpuZnDXrVNAkbR4WWeDdFDsSandph0DMPSIlBFLa/jaQPJMRCn
	 POiCHGeatOxiXgnpUUuH9ptpWgRtgpd1OD1EZYFzSEX6mm01oQY7nAcpsvlJuxqlAxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJlAkfVb;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D21606A330
	for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 05:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D21606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJlAkfVb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-372bdb942dbso4984947eec.1
        for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 21:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460323; x=1795065123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=iJlAkfVbo73TW7gLf2Zgc2Ph6zkV5cc9HRzqA8r9GHVsbZNZXZQ8GWRMf93ZWB0B+P
         CtueTgQMtMe9tXoR2C7lw955e6jvS6HfEPQV2bSisx754hvnYExu3J1mDGS1jx7qLU7d
         JZwgEYzV86RGhmL99eq6o4KshGNkrcr2OpEFZrVNZEkrsmjgWal+4saf7gxF+kHz0cSa
         nYeZMFChN7Nmc843fY1CN3dIEc2HBTexHN0ZVeRKucORhTaJudQR5RmM0JuFNlZW63Xs
         nfafEo/BK2to5/nHkaE1hnrp6pxTbO3AaoAhh2AUP7DU1aYH8c2yFg2Zy5sxUMTblmB2
         N84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460323; x=1795065123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=dnD3DMS4SgIYOF0pSppKlpJsIUESdy15SCAVprZnHNZU7PyaYUbq+CvOQVg5z8TjxM
         Tbz2XEgSfGL3ZOw/pehN22gkQC6gQzcrdvZMTIPbb8xfR46eO51oaHkb9KGb/V6VA62n
         RE3/b1iD2jUfOMyjRCX9yRjbk+orEuEnDVY3gCLCOqeMYHqdsNuPo6wjl0Ce0bgaJwEk
         Y2wjAwDat1HpQeFxrbH5a1gAnWq5ObDQMvGfNag0W0+ydN9uz3DDwQoU3mqhoQEU+3jb
         sxgkEdBTtisAHyrirpGo19Rp2c2pJufnUCWiTwNX6RDnw3bYWh13ZsJq+FOdj90P/Q9A
         jD4A==
X-Forwarded-Encrypted: i=1; AL+hErGLW+5ewVF/6aorrVqPIFRmRp2WYZ0/Hp60v6nk9PBTwLgNZqHrQqrvIc1NCB94fDyg9BScuJBpxOY=@lists.linux.dev
X-Gm-Message-State: APuU4Z92Bjn/BDoM8InbMuw4jPWrbOsip0m/pF1w05K6pJHDUK2Fc+Xx
	jiaahAhLTt5tRjnMdi1LkZ+1vIrqh41vYr0CuySV2K2kCu4+LmqE3eaH
X-Gm-Gg: AYBFou0FGddSyJ2Bw/rH9af1il2zrza0MxnlGWmX1BjJiQ2GzqnOAa4hJAtsmI9+m0n
	/0f9mf9bwn6YUWWdjOUntnYHxPBc6jDDhn9RxVzYFEyA3IOY9/R6Z9PL039sLterk2SVFUdV1jg
	pkSMQfo7NKgwN52pofOcN4ZmS1LyRa4HubdRdHfvatDh9itkMYSrTXX4gCF1tmAvy2hlsTi4nfv
	ekLiFVxB7XlY+ERk4TNEl5PyL9iNRy33N5QjQYO8HD5s76HsGO0K3EkJkUWvxDea5yiX0MH8Lo2
	FzqQ5tBhGEoPc3wsgB9nAL+qYn2kuiGpyWkskt0iOI7xeutc0cRUkKFioTYuiqFyTDmgRXSsum+
	ldQuGk3O9PM8N2Wg8u8/33mcyY8T7wRmcKf3D6kqF0I0ziJ1BzB+6Ffv+KlWU/C7HD5IhsZ9inf
	j4INxE1e/xx0edJUqc4qFG2HpS0pXnmz+wYWdBPWQfXo5JJ8zQfnROKWnyewkyd5Q4/3meZcEwa
	tzGnKd5DWo8s9tis2r5Xd7y5pexq90lnBZ9LOxmcn7Nejc6ErsDz7MBrcy5yY/4VI4+95DAj5iS
	GYWR2LBiRXuxG00NkWpq7Ggq4Qdw18qUbisB9WfWJJF6a1eTIDJGeXA=
X-Received: by 2002:a05:7300:e024:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37685b80494mr4971787eec.11.1794460323501;
        Wed, 11 Nov 2026 21:12:03 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:03 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] wifi: brcm80211: move d11.h to the shared include directory
Date: Thu, 12 Nov 2026 13:11:29 +0800
Message-ID: <20261112051142.2797529-3-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

Move the header to brcm80211/include, where the other hardware
definitions shared between the brcm80211 drivers live, and include it
as <d11.h> in brcmsmac.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c          | 2 +-
 .../net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (100%)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index c1a2318d7e..eeae85cae0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -28,7 +28,7 @@
 #include <net/mac80211.h>
 #include <defs.h>
 #include "phy/phy_int.h"
-#include "d11.h"
+#include <d11.h>
 #include "channel.h"
 #include "scb.h"
 #include "pub.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 9cb09c8a13..d81de701a3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -21,7 +21,7 @@
 
 #include <brcmu_utils.h>
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "scb.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 0a0c0ad4f9..6841bc0052 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -17,7 +17,7 @@
 #include <brcmu_wifi.h>
 #include <brcmu_utils.h>
 
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "rate.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 2b10fd5427..e178b1a0e2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -18,7 +18,7 @@
 #define _BRCM_RATE_H_
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "phy_hal.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
index 79d4a7a4da..6e92dc4c90 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
@@ -17,7 +17,7 @@
 #include <net/mac80211.h>
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "rate.h"
 #include "phy/phy_hal.h"
 #include "channel.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h b/drivers/net/wireless/broadcom/brcm80211/include/d11.h
similarity index 100%
rename from drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
rename to drivers/net/wireless/broadcom/brcm80211/include/d11.h
-- 
2.53.0

