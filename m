Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF1451049
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249985; cv=none; b=ojo0KiwkLW3IOyCzet9nuR6KIFieZls0isRNi4lwsVAG93o7XWP82kodpH3qKC3IU6PX4bpQllDbLS0rY3YuzWohpdxq6Lpf9loRTGTkgRoxq4vjtXk+GHLrfzW6mMgPQqiNAPI/zC2NgOhpWMTEOK0+AKjEObufcWIhaXfdqnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249985; c=relaxed/simple;
	bh=C4VLmdlEq3W3SF6LD/PGxIdNW6CGKbivGLyN16kk4zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGT83+Z6VPV90L5yHvVUcLMOQjSePf1t294KtpzjvsYsTmxV5kaqH14KPxDs6pl4TuCQ5qbIA2ECaeOrF1ZfsrenwXel1U3YYU4+qDCRAz4EDhS1l5P5ib+51ywaCywUtGcFjniSLGRFlAYaciV6vhMOhVglcO61vrjC7av4tfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cIGvZGoP; arc=none smtp.client-ip=209.85.160.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cIGvZGoP"
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-52192509869so30011881cf.1
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249983; x=1785854783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6Q6qGby3ERjMgl4TFGce6QoHTS1tMFMX4cxoOsORXA=;
        b=SlQq0Vk17c1gk8I6VfvImqMD5QCyWATql2NQfHWe/NgDHJZ2ZaWt/i4ZFqKGDME4UQ
         fMjM2uoRm3X57/dgeM4E7IdvBNaoYJLCvja/ocKkKz/T1AaTccGupsJVGc8vuE4omkkS
         c5EI6XyxsD4AKVXYlK9j9Gqj96A3Qx+oOdQGutUDrrh32/foSrnf/y319QYLGYU3Lckw
         DO81EnwO0lPT6Xa3yN5gmkosMgVpPm7qUiCKPOHDD3mvrHClhjfzZ4+wbQQwagP9WBQf
         ID1y1j6mz5JKliaLSlyvQYe/3F2N7BjCDWJMOhNYeJ2kZ+dDUUPaXNjUhwisI7YzSo5h
         /I1w==
X-Forwarded-Encrypted: i=1; AHgh+RoluiOWF//hApb3YX+BbQG0AtubAXMCaZFfj/kA0VhThCHjRWk5UH61BFf5qXp3Pk/qurNKqssrwbU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxh3WXr8U2cJHJSc/Rdaq4/1OwGk68O1X7II44+RFDzb0ATtTQ
	Qk8mzvgH1NiJaDg14KXPMuoQ9cX6OYdBTmKjCKltxQWwDDfgZdbCM3+f4tLiCa1co+z8U4sk9oD
	zuu43HrtydrDCIp6j8F5TN9F4wsMvfkoFDkzW+2zMdtNkxwXP2GKDG0TbEP0iP2+jc0n5ZpQkvC
	bmoduGwKJ6Dhi+JyJcnAcT+TJ3qU3z3UWeHQC5JTh1sNaFXBUnXENBA1/Xr06GzbZDPSLAiJPrw
	54hY4V1Ub+CHqb0BEKO7w==
X-Gm-Gg: AR+sD13uQyw5uLIi0mLywuYqwaO9Ht1pDFHx5GoOlwPPEYsMcjdMAp006/nXtPQP5QO
	M/jnMy0G6Q5UNnAHNzqop8tHwpuxBKoSsZDVt+or6GZpivKQMYcfdmhHlkKINAixrEVXZam9z56
	UDVQXlIXdjHd95jW4gB/VMafBE8sShN6VeUnkz0uAKBQr7aZYGyi2QWbLzy3V3G3vK6Cgr6hI2g
	tEQNV5LHS8AhfEf9Tp8xw9e3z2j5GeuCxjZNbl9BcGjWGLROHkrpEKVkieNhDjhRZHfhMtygmMc
	FnB3SBwRyIKJfupwh0TTHqjCN25eWF5mae893BtLh1zmsn/FEhFeF/ltm2kaP1Qc6IwUN5JHimH
	2Ed7TPd7AczOfCKXCTZD/KGRWI0ZzmU+Bmgo5q8rDE75WIdJaT/kbFVby0bk0pSNB8z+efI1rSm
	UWtkIRFPjn+7yrRFEMBnNLTS0IYJYMPX+49nM97i0=
X-Received: by 2002:a05:622a:1191:b0:51a:8c97:fb98 with SMTP id d75a77b69052e-529d71eb804mr22948131cf.65.1785249983312;
        Tue, 28 Jul 2026 07:46:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-529a29cfa67sm2452291cf.28.2026.07.28.07.46.23
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7ee64b25so585571185a.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249982; x=1785854782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6Q6qGby3ERjMgl4TFGce6QoHTS1tMFMX4cxoOsORXA=;
        b=cIGvZGoPsO8m+15PHRD+bz+L3J+Y3XaQ0mFiT/KxUif+TRJ/+Ve6wEtTTW7XZBQfi2
         2RyGHwd3LFI4+OXXKvUdXG3tzckIviHmth+7WXN8NVe+kcdfRTMQyakVCIk+6fdExtUN
         NQSbai/4dlh2D0fuX6SM/nkQCY08GPdUnN5SA=
X-Forwarded-Encrypted: i=1; AHgh+RqLA1ztIL0a1uKmNEU8hWa8SLq6jl6i160fNntjMm4B+i/tSvEr7TeyViB3ZfWNXVIfUHp6+Rmcqig=@lists.linux.dev
X-Received: by 2002:a05:620a:6888:b0:92f:279:f8ec with SMTP id af79cd13be357-933029e6c31mr249285485a.74.1785249982610;
        Tue, 28 Jul 2026 07:46:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:92f:279:f8ec with SMTP id af79cd13be357-933029e6c31mr249281885a.74.1785249982094;
        Tue, 28 Jul 2026 07:46:22 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:21 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 12/12] wifi: nl80211: send frame tx status event only for non-zero cookie
Date: Tue, 28 Jul 2026 16:45:49 +0200
Message-ID: <20260728144549.2207061-13-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The cookie value assigned by cfg80211_assign_cookie() is guaranteed to be
non-zero. So the zero cookie value has special use in tx_control_port where
userspace can indicate dont_wait_for_ack, ie. not interested in status. The
wil6210 driver also uses the zero cookie when wil_cfg80211_mgmt_tx() is invoked
from debugfs api the driver provides so the event is also redundant in that
scenario.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 net/wireless/nl80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 39398d89c5ad..708e8bb8dafd 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -22034,6 +22034,10 @@ static void nl80211_frame_tx_status(struct wireless_dev *wdev,
 	struct sk_buff *msg;
 	void *hdr;
 
+	/* userspace not interested in zero-cookie status */
+	if (!status->cookie)
+		return;
+
 	if (command == NL80211_CMD_FRAME_TX_STATUS)
 		trace_cfg80211_mgmt_tx_status(wdev, status->cookie,
 					      status->ack);
-- 
2.54.0

