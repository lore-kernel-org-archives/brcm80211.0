Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD9423794
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116931; cv=none; b=OBEzJghdF3t1XVXLOh8XtCpU3BtciABLD6fcME/+Dwy+YJUnaEk/d5IMmnBJgvLUkhII1s4pI0sOkoi9clJ91q+xcVatukr8yWQwk9F8Snm73GXxhYxAuZ1hqRW11rnH/wDObZ6I8CXu3/48bIhIJU/1SO1Mv1vvf37HBzajMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116931; c=relaxed/simple;
	bh=xqMc2nFRzl5bCD+ATJaS5tK92XhGJq67FhleE6gkzk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMomUZ0AIh3kbx/w6zve8wmQEQ4sCTUWHS0USY29PndVPYHarug8whUwJJFOSOZk2z0oXkBpExtMFvKwTffTHPR0HfU4lNrxHjLFFr2Myo1HLumatv514MPDwQ9UdkdPvlgSjYMDDsfnw7+By4pahXCo0bdvasc/6dXEWksK+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cGcXav2t; arc=none smtp.client-ip=74.125.82.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cGcXav2t"
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-35120d43ecaso961399eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116929; x=1791721729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8JCCrShX/OiK0rjMqICF2+soAKosuntY3aTL2G77+Q=;
        b=zXEk4colqhw34OLktq5KE4hGFlYlgxp5MhB/6IfFrWWYO713YKUYOPPgGhn7UvA6BS
         ojjBY9LN7X9GLD/GYtnDLTLbQL//QHvaFiIvDm2ACge1PbVelpsYJ+ypWYGnDGBRN3oF
         GI3GWgA61/wCo0tg09Ly3C8sswhFmBFOcwsqmotdGHl99GYw/j0n2ZTqh9MACJpS9FNa
         bug3/rMZKwME/gP9U2aaCcH8iuY+qMQRTc+t8TF3JxUXKYO0iS5Unf1pVd52pEUafB+g
         6lYRAGiD5G/otLyoZ70iKF0Qt7sKKMhM+nZI1iXZobBT1y71V83gql/0OWIOxhrvD51O
         QJUw==
X-Forwarded-Encrypted: i=1; AKwUvBwiWYjTdrX6VxHpEVkos+Hasps2rtp95MZLsLl4oZtZ+M3v/7uNlQ7jx+voP8QJKvhJUUY1bjZ6z9I=@lists.linux.dev
X-Gm-Message-State: AFq9FYIgryMacltdcyrhtAeS5GpeozYbS9PYwHOygzmlbyCULSU1Cqr2
	5n94Tn57JMJggVUFD8lOwLqPztQtSexjqKF2yw0hgtvrLifWsFk3aalvdofLAEQYxXlM5SOAs4w
	YF0R9exhpsT/FTLQSFTT/K7MxHrmB99nNc5mzFRSyidW4TU2vVEZndRquHWRkMlgNg3l5Hq2TiM
	/gD1x1kLBQmx+FwozXNfnQbNzEmKYZSmbXMYmLaB7F7DYPt9LMTCme5X+y95+pbkJz4plVFERWQ
	Ypxog+Srp080zLRsvflGA==
X-Gm-Gg: AYBFou3mo3Zy4MruUWUiUhfZUSnT3sl62NL/MoomD5h5eBGiJmNi1G4acyqyx+N51by
	qehhBwpUBqVJJ1SBgzKxyKAQa+t2RlbDEsyh5klPaO2Y60C66SlpDwQ6AbWzSXS9cDqg3K2JGtR
	9RPWoy/uoe4ocW81C7UZUFDiYkFcV0oVThWudOW0Yc40MtqPdnM1wSGwO8Xjrm/Pr3eUthNGVyy
	MR0mjS5wBLg6/1KVMgaUI7re9dnnqKCZWeyAL4NKq4L24o0cOwvlsmXwSH6SK+cr2YGMkyZVoeX
	TqkbzjuhowOmjCRxsWVTT01UV/o+MjrOqDayvmfVjLcz+lsP9KWIPK6+YkcOrlSmZt81fuR90I1
	mD/e8fWyu+2pXZLRiG/8rUMVfgpeDIT7BiesI64WsL4g7sx6ABSwvyoCV6lGH+WeYAPJlrnHkHA
	0dDGZAgs08z1NvHkTXD8h8CSG+0ZJVD6zbrk3eZR278w==
X-Received: by 2002:a05:7300:51f9:b0:351:12a9:88a0 with SMTP id 5a478bee46e88-35112a98c16mr6590930eec.4.1791116928998;
        Sun, 04 Oct 2026 05:28:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3512713cc7dsm10451eec.5.2026.10.04.05.28.48
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:28:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1937881eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116927; x=1791721727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8JCCrShX/OiK0rjMqICF2+soAKosuntY3aTL2G77+Q=;
        b=cGcXav2t7tgBEcHHCoL1VLs1JdTT+KTS/GXxAPAPe4yjxFhqjWCffUFd0clCylGLSh
         PtU9t0BtUk+rrw/EpF6zXckdbU646LFYiqOKOfmxwhkUKFlMyuBIg3/yYvoZyq5jAc1B
         QG+Cx0KClgLo7GbHHg6HXl1BTFa64hL+Kh3vA=
X-Forwarded-Encrypted: i=1; AKwUvByAfAGgFs3L0iskpYjgA7ruW/tnj6P7/LWjKl5++BMYxrhyf9Ry07TQkBCOO327ZlpjuY5IQxiaYNg=@lists.linux.dev
X-Received: by 2002:a05:7022:5f01:b0:153:e0b1:5b5 with SMTP id a92af1059eb24-153e0b107ffmr3054131c88.31.1791116926995;
        Sun, 04 Oct 2026 05:28:46 -0700 (PDT)
X-Received: by 2002:a05:7022:5f01:b0:153:e0b1:5b5 with SMTP id a92af1059eb24-153e0b107ffmr3054112c88.31.1791116926354;
        Sun, 04 Oct 2026 05:28:46 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a7d1sm12234015c88.3.2026.10.04.05.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:28:45 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Benjamin Drung <benjamin.drung@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 1/2] wifi: brcmfmac: Add per-board clm_blob firmware binaries
Date: Sun,  4 Oct 2026 05:28:40 -0700
Message-ID: <20261004122841.1391116-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923203739.2560527-2-benjamin.drung@canonical.com>
References: <20260923203739.2560527-1-benjamin.drung@canonical.com> <20260923203739.2560527-2-benjamin.drung@canonical.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/23/2026 10:37 PM, Benjamin Drung wrote:
> On Ubuntu 26.10 these firmware file are missing inside the initrd when
> including the brcmfmac kernel module:
> 
> ```
> /usr/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43430b0-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43436-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-compute-module.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-compute-module.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,500.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,4-compute-module.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,400.clm_blob.zst
> ```
> 
> Commit 885f256f61f9 ("brcmfmac: Add clm_blob firmware files to modinfo")
> added clm_blob firmware binaries, but did not add them for per-board
> firmware binaries. So add a similar glob for the per-board firmware
> binaries.
> 
> Bug-Ubuntu: https://launchpad.net/bugs/2168109

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Benjamin Drung <benjamin.drung@canonical.com>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
