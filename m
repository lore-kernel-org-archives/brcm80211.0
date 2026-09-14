Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4349CF52
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416273; cv=none; b=rlL62boo5qSnPiBudxg/1D8Gx0Qt7PZVwmwHa/CA3VqzGez2+wPF3vo+PpPsTfcedZnBCHoFXnaEz3Em8H6aw0VqcTCUzGWYGkSdQu8Yc3I+2JejniaPHm8iF2wBlWC811OFO0ZDxbk+CWeD+F2BvCpKOn5UB+NJzE8PDHfEEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416273; c=relaxed/simple;
	bh=wA5npbt/0D/RB2shwDo8pZnhFtmbBXBtO12oh/kCjqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDXp0ZTe4Sr606pLVcfYuF1SsUC2SLihv4J14VRDweXvW3YcmMcI1JVrHw+DvTGC9hONm8n0lTx/BI+EXnXxYI7yLBG9RaKb6T6K4oPCMSZ4wMGw/XglQ7wXFG1PUiGvhLCEmP+WBwN4YIRL/nHin+ogdW4U0q8AMiZi1LZPAok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bZNrNB6s; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bZNrNB6s"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4fdb11493so124292a12.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416271; x=1790021071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBdGfTu/DEGD7gyyD7eHAZgClVSFBbebOJCf/wl37k0=;
        b=EznKnh5NyhrJCB1pxVKCg7EfVm+ZmZayskE9ukDbmvkmjznf3EDm/LyYtYYlngKZE1
         X6rVAycNwu2gvmQ/e7n/rlwvgAhDhNtpbnSGOKu8bcw9xgPA4HTf5qkemCdDfih8edX7
         iVfKzd3RjPakgXbh8MD9cO37J5qC41gXZyhQhLvUIjGecYkuT4c0wiECMC+FSDCL5Bqv
         zzRhQ6QeAh8ShyXhTX5lBhMWtsI3cbq3y1Ug8zPEa1EKUxyf4kWFGEZ+a68ZrvpqOCG8
         ZDHJbrgxp4mu49XCMgnCtSjAXZMewgpBep/Fq3YVHVMB2UJcsEkIdFfzdT7SCGbOMC0j
         MKZg==
X-Forwarded-Encrypted: i=1; AKwUvBxe2g+Mzk1XIOmWfli6XBCs4p46dr0gbTRc37gjK1RNAIrta4oMiN1jczTJ7AfbeF0C9VF7wWvLOPU=@lists.linux.dev
X-Gm-Message-State: AFuF++m9i97BXQfIMYgS9NcWhpSs36jDC5/E4OM++dKpnNpB+62sZt+9
	E5lQAzWEncdivVTg9lBoCa6SVEyFmNWsKqru8ZTD+irbQfrqTNNWf5vbeBfqQTR9ZGkd4+QB0sU
	tp3sGni+vitnf2bawI0hXaaFfLG63x1ajjZLIRw8Rv+sWQEML5osWFYwxX4XbiHubMTk6Aaj/Y6
	Pu7ibn+E+1wH6BRVhLasjadYWUTtJ2YtgMOWh0bFb4OE9P0WA/yObqFit1v7otjAebm54bSRJOs
	CISIHN8ZA4/H3nsg8rGfA==
X-Gm-Gg: AYBFou1YFWppUDZuoJOEMF4nhI28Wew/QraHaBfYnYg+pvJKa4ChuyRQUPab9JxX62U
	TwcdDj5FmdUELxPOVtUDgqWX1dbIXFc6LeEMQ9OnBxhuYKdH4gRQ+eFwji0cw1cnCjmd5zv2f0u
	5pHw4rnSbIJwHNTNjAAXC0Gm5B1MKWfx/4MpE0vH0Nw/HN4FCjrPSGFHuYBdsrNLgRCocwwA5Nz
	JLPdcw3sHgSJKqcpjpYkOLfY6V5gfL2O6z3xHNPoaGKpNqVqhn1BrUHrwK3wa/drydQrIg10y3a
	cDbwU0RsmrD11qU8hassr5F0vR9BQzEBm4Z5R5exyZ8UNWkd1ggSBQaFEmZQIA6+n9GPQYh1z6j
	WSrsJBL9aNZkaKzj9SOQbl08aMQl1eWMGpvYHVzDW44/yiNBcnvQf/wKa4gLyR34=
X-Received: by 2002:a05:6a20:6a0f:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3db404d650emr8014122637.8.1789416264932;
        Mon, 14 Sep 2026 13:04:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4f02a0aa1sm1533130a12.4.2026.09.14.13.04.24
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7989d8ef4a6so267166137.3
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416263; x=1790021063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBdGfTu/DEGD7gyyD7eHAZgClVSFBbebOJCf/wl37k0=;
        b=bZNrNB6sMz2kt7WVZSHQI66cJ0GogArlcj7F13PaiNsYHlJhxKJUe2+F6xcp84rUuR
         UGpujvJIfdxtxK0lGScC6jwDLQyXlHi9gze7m2MdPbQxB9OcJO0R95J5cHYfMdWzH+gG
         56LXt2Bqfu5YqIrkTiJ3e0qIk5nGcCUDYZTcY=
X-Forwarded-Encrypted: i=1; AKwUvByy+ohCefUf8qE704h8FTIhWRWlSVaMDC5undmiZ6kLX94ov5QJtmfe2KLvHlHl6DcxhcqvW2noRis=@lists.linux.dev
X-Received: by 2002:a05:6102:38ce:b0:790:322:8a36 with SMTP id ada2fe7eead31-79b5b2916ccmr4709301137.8.1789416263438;
        Mon, 14 Sep 2026 13:04:23 -0700 (PDT)
X-Received: by 2002:a05:6102:38ce:b0:790:322:8a36 with SMTP id ada2fe7eead31-79b5b2916ccmr4709202137.8.1789416262887;
        Mon, 14 Sep 2026 13:04:22 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm103068516d6.22.2026.09.14.13.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:22 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	wlan-kernel-dev-list@infineon.com,
	Darren Li <hsin-hung.li@cypress.com>,
	Chung-Hsien Hsu <Chung-Hsien.Hsu@infineon.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Carella Chen <carella.chen@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v6 4/5] wifi: brcmfmac: report port authorization after offloaded roaming
Date: Mon, 14 Sep 2026 22:04:14 +0200
Message-ID: <20260914200417.1744264-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911065656.1269623-5-Jason.Huang2@infineon.com>
References: <20260911065656.1269623-5-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 11 Sep 2026 14:56:55 +0800, Jason Huang wrote:
> From: Darren Li <hsin-hung.li@cypress.com>
> 
> Firmware can complete FT or OKC roaming before the driver reports the
> connect or roam event to cfg80211. Detect those successful offloaded
> cases when the profile uses firmware 1X or roaming offload and the
> association request carries PMK cache state, FT is in use, or OKC is
> enabled.
> 
> After reporting the connect or roam event, call cfg80211_port_authorized()
> so nl80211 emits the dedicated NL80211_CMD_PORT_AUTHORIZED event instead
> of reusing the reserved NL80211_ATTR_PORT_AUTHORIZED flag in CONNECT/ROAM
> notifications.
> 
> Assisted-by: GitHub-Copilot-CLI:gpt-5.5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Darren Li <hsin-hung.li@cypress.com>
> Signed-off-by: Chung-Hsien Hsu <Chung-Hsien.Hsu@infineon.com>
> Signed-off-by: Chi-hsien Lin <chi-hsien.lin@cypress.com>
> Signed-off-by: Carella Chen <carella.chen@infineon.com>
> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 5 deletions(-)
