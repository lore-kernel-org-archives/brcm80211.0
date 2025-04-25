Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410D422CBEA
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570731; cv=none; b=tz1UZ0t1IoJgTMbz8XHxV4STN88+4afyCAvFqDIpMSNnlRl5HpRltQY3rYGXY7ajD0L+ohPUUIERbu6aL+3Oma4YFxGTbca3ZhArS4/dCsuWWxPRTQy+gTdoAPHWJGEN/QcbBNF6h5RKI1sZ4Ed822/5Fm94mc4iaTiQVlfP2CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570731; c=relaxed/simple;
	bh=omYrwZdYb25oWLgw0ZEamY66sK69quFj8xSeiTyG0n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WK0BGH8ZtwXqypNPkVcbNdy2DTUDjtXYtz19mtI+AorJQlw5+WkN16REKCJUIjRrqcYWIMrxM0I/OroCHC9uEyM8fk/2z4amUCI2heHAnDZHh9pSpfsWFQEhmj9Z73J0eA7M17yfxROEnk4cR7fXeowDmwYqDzVl/uzzTvcKoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y1IHzU/A; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y1IHzU/A"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c33677183so20819205ad.2
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745570729; x=1746175529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9P7ZnmS7Adv4oGaE9rUSXG5FVmUraTI24z/lLS0uB4=;
        b=Y1IHzU/AW49WFcumqEpteu94epLyw1nsAPewxQNRjyNMbMIa2GiMLLapUR5oUevGIx
         D32QNAKHvYZRcNke0/68hFuvq9CZrYjtIULPf3wEuQozSJw83TFfe2ksN45NMUOh4wFS
         4v1ArTuqOvzrntYBCqiIp4fHX7G5tH4fATJfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570729; x=1746175529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9P7ZnmS7Adv4oGaE9rUSXG5FVmUraTI24z/lLS0uB4=;
        b=nHRCOTdnK/ecuNojrnqH5D6av1M8bO7DOFOgPAyts+l3N17uJJ9FKZ1RbJl8MBhmbK
         VgAVoWTy7mQJ+keFcwYm+Okps97rtKT0sIM8EXyXi+Tfpd/xBLQF3RGcxySWRy+swIBr
         FAmMuvId/6e/JDHgV27xE8DcXcHIGbpWdIw4KXdZlvUz4RP0aIqgO0sX35yAx0qkPElx
         CU6BKl0d9ZN/zdbcj7qx5QpNXi2YI9kOwe5WGUZVj7RoIrghivSSUUCrgFJyqe8X+7Op
         AUIdlmRx6yxZ3f2PS8rNtzHTirymtCoyRCXH6c9oE5WCxvjlOkP3CmUJEQ53qmMxwW5V
         AWxA==
X-Forwarded-Encrypted: i=1; AJvYcCV1h/ktRxetsTqtQgx5zAGB2EBqUw98ed89pxlFQF72s3Ych8VwQvv+SOryn9jcyMcp/5UxroQOZGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqUqxbnBdUxjuJ5APSomLclXIWgVhmVFjc/Cb5JdPN1V0MwaWI
	Z78coelKGRYz2ESXf+Smljh2++pXbXC8jF7hoV8qTMfRchW+XhZkgg0/XgYoAg==
X-Gm-Gg: ASbGnctMaMqmQ6FNvGnVLogiOZvZyxV3FNIAP41aOnqKwbqJg7Xa6u/MC6UAEpf03mF
	01zsPcFW8X30FRTEUmdl0BOHnW47avw64eKj8rDrQUXoqdVLxJNLn8pMh5vVkoMPrKw0ev3S71t
	/0XG9b3RF1FY5CAH+7r3+3XFBeHIt+5jvF1chI0YP6VUOesaGCmEaF5XJf4Sc+bcybZS2TNHaDA
	40171Uj6N85kTZxIWsZ53KWNgWTc++5+VIWIO15BkkggwI3gArv5CnsAO7voGlaRRxC59LibEWO
	bsbaSm0e6EM0CWAWhsty0q2fzl/ibEjPoVkDVXbRs04J34+qq3XcJsTrPzGk4OADqVR0V34YUCI
	o19BI4EOqomvbTX7KolEi
X-Google-Smtp-Source: AGHT+IFygxOVxMXjzAP1V8OvkKX1EfIZMiFMhKc+765KzampPZRjlxAWaBU0yFvoSDGMhyfP2Ew6Rw==
X-Received: by 2002:a17:902:db0e:b0:224:a79:5fe4 with SMTP id d9443c01a7336-22dbf5deeb8mr21635345ad.2.1745570729408;
        Fri, 25 Apr 2025 01:45:29 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm26883665ad.190.2025.04.25.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:45:28 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Ting-Ying Li <tingying.li@infineon.com>,
	James Prestwood <prestwoj@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v2 4/4] wifi: brcmfmac: Fix structure size for WPA3 external SAE
Date: Fri, 25 Apr 2025 10:45:05 +0200
Message-ID: <20250425084505.491631-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250425084505.491631-1-arend.vanspriel@broadcom.com>
References: <20250425084505.491631-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ting-Ying Li <tingying.li@infineon.com>

Add pmkid parameter in "brcmf_auth_req_status_le" structure to
align the buffer size defined in firmware "wl_auth_req_status"
structure.

Signed-off-by: Ting-Ying Li <tingying.li@infineon.com>
[arend: adapted path to apply to per-vendor variant]
[arend: added kerneldoc for new struct field]
Tested-by: James Prestwood <prestwoj@gmail.com>
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
index a3243b940f10..08c69142495a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
@@ -48,12 +48,14 @@ struct brcmf_eventmsgs_ext {
  * @peer_mac: peer MAC address
  * @ssid_len: length of ssid
  * @ssid: ssid characters
+ * @pmkid: PMKSA identifier
  */
 struct brcmf_auth_req_status_le {
 	__le16 flags;
 	u8 peer_mac[ETH_ALEN];
 	__le32 ssid_len;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
+	u8 pmkid[WLAN_PMKID_LEN];
 };
 
 /**
-- 
2.43.5

