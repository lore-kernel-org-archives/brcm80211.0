Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993015;
	b=0RaQY2jD0mrRrC+uih1uBucFpLQAN1D1EgxaOqHSLmbIsRiJGbIyYbkqxr5AyerhKXOB
	 DUuctTG7xHM/SdbCCgrxeiKFXbHRQ6XoSdqUz3icqhSkOI8WNT5Le3N1optBkxNW5T3q+
	 4X1uFe/QaQwc9dkt2JrwSnzqyuFrQcNwzW0MmE3txBlXxj+vzx0xL2GtNfPf81aiKD1Ci
	 mV7zkDsRR2ARgNVzQfyd+58R7Eji730RrmoBqRP+2yP96xZPFwcRN5va/qFmYSJD4ALA/
	 bYjgVtKqLeATH2FxuwJbzNg22nJwVg1HJAnj7GfeO6o3WU/zZ7qKwUn1SlSfyFhqPKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wjwWza2KdfjVMB2kV9JcWa2D3gvBu8dp7vTolxEAakY=;
	b=fsj7/PgKS8MLk3btgwUFB2eDcXpueaC21ScusIxT5ubfzWGFmUkf8PXJIkG4qJ0kbt0q
	 tbbig6Wn8bXFoif+7P1BIKjvm9q4+83fvqhyBwR0mP7+XhFe8qvKlj6LDijqqys+Ctph1
	 URoxAJ7hSzrJJISgE1XYCow0rrwnE862MFPOSnJK+0is2umIxTLT9AwV2CB60W00u+L7J
	 bJJaDpkbfBISYF7cL7KPTrn53RjJwVD00NnrT1M3rXJrHVxF4F9Usq5TuMGEE7HtLS8oV
	 zba6s2EZ5BpqHxBOSezRXPMY5YiA9OFyZaLlu9ltOUj0XbT25NArQnSxgPeivLy6KIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m1Ro1Y66;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467B606A31B
	for <brcm80211@lists.linux.dev>; Mon, 26 Oct 2026 05:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8467B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m1Ro1Y66
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a07025cce4so1624047b3a.2
        for <brcm80211@lists.linux.dev>; Sun, 25 Oct 2026 22:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993015; x=1793597815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjwWza2KdfjVMB2kV9JcWa2D3gvBu8dp7vTolxEAakY=;
        b=m1Ro1Y66MY954jgtVVyEuT3m1JEpjuYpv+xpBcIJlzSVCE59H5tiBm8NjLHmE8EVpo
         IOit741VCcIGn/UeBL6IqotIHZbII3/Ocw3iPV9BYaMhCPYywmphECq6u85eVX4+5RWu
         GhvDVYUnps/cT1Dc0JyV8EiQIOeyzPrhU4wGwi3/YwC8hLmZtP7tGp2DUproosnPd4sB
         flM3Llo8o4jPnkOj7C6JkENBWkCsr55WFqz0BfG2ERgdqVqDMqS+lULQwIg3dQx1h3X2
         uzNvnepGyGtStZ9nX1+q4a9xtgSdm0Bh4Z9y/bUiOxFPZE97gfl0g0hd14pJkFnYhRpW
         NHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993015; x=1793597815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjwWza2KdfjVMB2kV9JcWa2D3gvBu8dp7vTolxEAakY=;
        b=OW8r8Jl6j4xPkL8+ti7v4geePe2Xvb1Oy4FibFZWmliqC82bYKvM23lsePcyiSn7GP
         iV/ELPRA4YsBtYyQ3mRTh5LVYcGo0J/WNEG16f6bN5KeEKHYmrQRUqHUBaMUBkISYIie
         FawmoC+HlAPnAsugD+x033R6DszG5J3cuAlmDCJRiJHPYfMqhlFIVUhA3czHxCMJLw37
         BP00sEJyE3dD/B0BUZWw/gvoRtxL9sukGFS1CZAxulM8sdx8+uPNcs9wWAJ5Drk/oHkM
         Ph1QZEE8BjsVGTa+q2qHlpx/fxHxqY2OoLndunz5YmHmh8YbdTugcVQ4Q2w4PuaB0Cth
         SDyg==
X-Forwarded-Encrypted: i=1; AKwUvBx9aeb/Iq8jg40ayC2WXFr7aic64vhwdizzeQGdo2PhRrFJIH8C+w6mR6gK0W/Y5W2tRrSkBCOxKL4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLXeqZrAqf3gtdOFNvHeoWZOFGNmyECKIvu1jsr09dKPKjG9Z4Z
	r1V94CvAY6mxr4JpR71o0wpgo1NU2VwH7vz5G0nzY0ZzaGFXWuDDAm6b
X-Gm-Gg: AYBFou3DRxKYnfUvjEriG2rJwe61UVueW5LfRCB18a5ezwxbZqXFzRBuliucsgblC4n
	HjlWYMHvF98RoYIZVMnYQM5zOGw0HI0g+cLO9tNBoz0edr7JLprQtsWOiA7n9VCs9jrPjgYHlXi
	vF9RUi7AmHqjfZ7dFfiAZVEORefF5nE/XNeaqK7I2WElmChKw87OFelh23rtbRNBWflUmzz1JTN
	5P5D0k1w5uwoVTlmPkQSlxGvE/LtDox3xMTPmxFYdznIkxw6IDG5NTQbOydYQmxCnFKJJdeCz8S
	wgi8iUJedQ7YbcwJKi0NTHxGBzU6zdWvbDV9rYCidBcFmTP7H0gVxx2a0RRLrERYyTLxNKZmmUb
	HDMgjv0HISHwNV/PDzvdDqmfbXQ7xy/IsphhNsbbb0ooxOEc0cWutGCz9H61p90Ghvlv/SqAuwz
	GRTd9yi9m7JD/DfYseIYPnWOsZACK5cOoYVb0o+YJhGiuKUSRghanCEhfhIJpdLDMjf9PQY57ck
	REtW0xOQE0no+Uap1cnS4m7LaAU4QG8WjFKDsYfsNCdrLJkn0kJsSDqroBtgRw4UurZXNYds8t9
	ti9r
X-Received: by 2002:a05:6a00:12cb:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a367a385edmr4665632b3a.16.1792993014913;
        Sun, 25 Oct 2026 22:36:54 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:36:54 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 02/17] wifi: brcm80211: move d11.h to the shared include directory
Date: Mon, 26 Oct 2026 13:36:08 +0800
Message-ID: <20261026053633.361454-3-ragulbaby@gmail.com>
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
index c1a2318d7..eeae85cae 100644
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
index 9cb09c8a1..d81de701a 100644
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
index 0a0c0ad4f..6841bc005 100644
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
index 2b10fd542..e178b1a0e 100644
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
index 79d4a7a4d..6e92dc4c9 100644
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

