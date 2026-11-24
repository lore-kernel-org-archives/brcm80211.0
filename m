Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551253;
	b=IzgkA/XOhr/lTcnq4kkx2V3im+X+yP5OKO1+JrQ4B5auvqUCW9wWaCzOg1fcw2x0G+o0
	 ylU5u/Eb7KT/aWlUNuo3VZdhXl5GfZnELYL+rkvilJLPwazhthe8qgM52U7tbJlvn75iB
	 Fz3OTuqp8KQGS4QdyEkqxc/97HD0G0tdioip6hP1njZSRkCmwxtrGS3RJ2A0swMvMZgY1
	 mN1Q3sSl1bgtzbcUAhJIrcI0vjZUYpsAciENeEySiH9lmEikljO3+KuWb9SsIt47sKV0f
	 qcAty2jPT38BQI/fE2QcozeUp/GhsPksdWAG0EDhg/V6obEMPHeLTmzdMMP3joOlTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551253;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
	b=o9mmaz2gBPpl6DpgX7Lb1onpjR3hWZr+tMjP9IVWp8JDtpsYM7hQaO5I1ggtDdEIKClx
	 oBkYRye433FvqgqLT4Gf2hzTUqYCWLNs7oDzTdUhN5xWvlFwbD37oi4Ah3qPfAFneVsK4
	 I653T9vJRWvH6ile9cZzp1r5a/iKB8FTHn2Mag6oJ9fa7HDMjV1NCannv1UNqojbvz/7j
	 VirAiwDq21D2o09Ja/qQDqQ+H8balzleS6fUZKE10UueeIPO8ti7ykvQeo6U6uVMnznZw
	 cthFchLJxmUoeKJjuMJKzKmcvdYB8Vpz6x5Z8MRuP5Hb144dd2k4qppgy7cd9wlInpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E6dDJnnc;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52860A2625
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E52860A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E6dDJnnc
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-3866a784546so6550254eec.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551251; x=1796156051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
        b=WqFDidGvYYuqzSqk2qBvxF9oiW5HXVi2cJYGa11PROwi0idzfnamHa3uMCeJqOxGm+
         lZpTsr1y/E5BAgsoxjThAJV2Q4SWzohZWFHGwHukJnagVrhuLqce29UITSSS+WCFa+29
         ESApfJVo/nyyvg7eHbcpTjLaKleh2wBqsHkCIWyyYvCj2PjEDbzmyjt1gLA9128YV70Y
         /7rxwBfjI1n+n+c8WX+pVLDOdJlNbG5NND6P1clLk8YVSHHopjl5N7JurapzHJhfXcoa
         Sm4CZm+uq0060qaP6/Yu1FiWp1kx8NYhckHzwxT6QdhRyh3UkzlQyAYjEtlWrs0ML0Gb
         5Nyw==
X-Forwarded-Encrypted: i=1; AL+hErEucvkn60O4pa+Gk0VwPo5wFNz2BzT0tf5hTTxsdjABcZDVe+BT4cpYBq0M9dH2IhaietfDd6A5qoM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8yXrPmD0yCmQZHM8rAqpRRxXI9qwN/0urCqvgZ/e/AYkXnScrR
	Gt90Hr5H6ru2/95tnVseMGxU/5ggz31HONfsT7TwMaKhZoRev2V0vpzWxdImOU7wiAK1LtBAvm0
	7ezF5K4jY9zOdwBjnjYry6wg7C7G98Ss/Q7HZEqLilF9ID0e0GZHxY9d+5elTG4cgiReD+fiMa6
	u+xyrZJZJun8EmBTXwxrDbu5DV6ijvl+/4V9yOUC5K/nnee8D49izW8+19FMZ1SmZnkU3+LhupC
	n/QGxv9GSPuq6qjViI00Q==
X-Gm-Gg: AZFdTZeofqPmPuQB7GRbiwgW/6U4AArW5qkgWfAA+Wjh7KF+PpGt8ZzV/6yTNefGIpS
	8tGimY3dJ6WvNX1CluusDVLVcfJR1w8Ed8Q1ASZlo+fSrEWa0pyXzN/wlIcVvwhKxFbng/Eu6fk
	fKL3BPBqgDBzeqV7Dwpbfo/pEWM1Q3hY8ojfCv0ytf1HpGJNOMt+DdnR+9qSynR9v/MD+8kd/sl
	axBkRJb03Vks3aEp5ISt+8ljPYW03h7CvpNP0VekUeS1cjdXD62s4TGSG5abGimG3CVMpX2aILb
	jIFLTpp4xYC8lN/8vvJRawUGQ0ctMigI22SQsDiOmOSHnqSvuim4Aqb9RNtfOn3jJnH2YJ2dRaO
	PTvn4fj0pO8ty7Q40S3lzm94wa7U6UeLG10i9qKuTNFm+ktiCqsuNn6VaXjb9pDwEKBDVRWBB9S
	+A+Rv+Jl7KWjCxz0d33ARFhFB240P2ECjRuielEvOV4w==
X-Received: by 2002:a05:7301:2e30:b0:384:6d4e:879e with SMTP id 5a478bee46e88-3856c2c338dmr14167166eec.3.1795551250798;
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386c7c627b0sm368104eec.23.2026.11.24.12.14.10
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920fb8b9859so4421576d6.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551249; x=1796156049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
        b=E6dDJnncQW2PbLefW8dlSLoFdY8OVeENYgYi3CSOTLOOF3RbykVIi/se9S89fkdFTK
         3svRcS4wcOUs3q+3bgzX+GRs9oeiFek/HeKhrqGuILUNWifRSLAl+MAd8GJvpvn33eMx
         WbGhBgBTu8rWfMf+XO7sEDDYIjZ8BwEFfVo2U=
X-Forwarded-Encrypted: i=1; AL+hErEBJafyzNk/dtN8VvlhcPlVGYw9OZ6sxEx9P6nqBrZ4Hz144nzEmvgf3aooh8qZhvKLclbeTfu7NS8=@lists.linux.dev
X-Received: by 2002:a05:6214:d61:b0:915:3066:2035 with SMTP id 6a1803df08f44-9213498a6c2mr285388466d6.7.1795551249599;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Received: by 2002:a05:6214:d61:b0:915:3066:2035 with SMTP id 6a1803df08f44-9213498a6c2mr285387846d6.7.1795551249068;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 24 Nov 2026 21:13:58 +0100
Message-ID: <20261124201402.3499613-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-4-rosenp@gmail.com>
References: <20261111042554.232998-4-rosenp@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:50 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The MAC statistics snapshot is a fixed-size struct with the same
> lifetime as struct brcms_core. Embed it directly instead of allocating
> it separately, removing one kzalloc()/kfree() pair and its OOM error
> path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
>  .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
>  .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
>  3 files changed, 4 insertions(+), 13 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
