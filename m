Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC917A303
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097750; cv=none; b=X0Tq+vvLT9EjKl3kKojsmNn525MV2epOuxn8uhQUxQ+6PmXFNJq7/LbEm6c7JUhdFolXC5GOxI7btI+kfmUVmg/6qomfCsg9btXbsNHHjEm4Rp6L/VhDDUKM1JlP0RFhDf9F5AFwp8PRbYx23kwEBDvqfleU+sTEk7UBPUUwOIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097750; c=relaxed/simple;
	bh=VGy+U0lOAalbyMtH4LqfLgyCJ01CIP7RLm8/iIkHWOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6Ib7nMIi6jdJjsXymgJFQ3saJZkHPAu5jC8efEAzSCmyBQ+qZacLWQmVU6SuotKZNWr37niEWWy7TJ+ObbUHoxXDFDLc3CW7NXZj61Zb3EH3BNlUxR3zhpnotYsAE7RTz3yTkojPI6XUplxqBT59YrKEgl3v/HKS+fDnD2DTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JX9JozE5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gY9Ag6wn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JX9JozE5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gY9Ag6wn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJvUQZ1764857
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 20:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wD6gkkVOfQLG02B5GEe6OBeics+ZfIQM7XwnWwyOQFE=; b=JX9JozE5gJunWKSB
	y5bO5aNBs5nuJSZApAQ9B7VgCPkDeylDkx24BHj8qALJoHySxCp+qqwPddkAMCr/
	jMbOsTrM0pyLnmqbRnb4W63MVx53/6d4fw6MKcutcVXFJU0/rKZyNkpnMN0EtaHc
	Mf2pnp6/0Zdi8jlvcLxR6qC+jA+eWupDVAJyUXGT4AVnUatDSiMa92hc81KHJ3jz
	Lan52u2TLQqZ3nhPB8Rn4oEFT/rQSE/i0RiJDRsJHCFirAxnWNQ6LegCT9myoE0w
	JCaypzuZBf8JdrIcFA4DPL1P/mAn+/VM00XL3VJbuO6Iw438LTgdyglcxGE0AUiH
	zdBqlA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm573uh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 20:29:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso59107095ad.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785097747; x=1785702547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wD6gkkVOfQLG02B5GEe6OBeics+ZfIQM7XwnWwyOQFE=;
        b=gY9Ag6wnXLfVOu7zi3d/To1+HteHEbe9pDyMsuwVg5M9as9g8UI/8FOILOtBzdccVx
         nOvRSPvaiKyvbN9ggz24TkXv3+fSV+62VebApsyQpV6EnGyTPlUgUPmHM826YNpXWPIx
         afJjvcPdCPwve0+umzM5cne3vredP/6oGRIQZlmCn0mWRaEGI99jvfIJiil0qPcm2Z/O
         0vqJD/GLG/o7icb6OydHDCK4XsZzh5XOtCqPLtHWI2tXpp3KKas1vhxqgPFEyZ16nFPQ
         p0NcjQSDYQtyKz2fAhix0CUThOSTkj1nC3YUYMd+0DHq3ng3Q/667IXBpz+/OstOlIry
         NEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097747; x=1785702547;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD6gkkVOfQLG02B5GEe6OBeics+ZfIQM7XwnWwyOQFE=;
        b=bwet0bLBmoDpFZCjtLGOQJcPmf82ZSDVOxQ8K/FlJkG0Br7wuNYzVvCoSIqERGUMr1
         7iqsoY10dk8dtxX0S/bAE/B6D7thBZjquWFfMvInm6dVsamzyJk0Co5tkifptuX57MYJ
         Hg2axfBNWL7nqerBkocHSRfb2uzBj8baP0aUgPnmGHg1ge2BjaNs9Dt5aM+I3llvswlB
         LgliAvtDozH9CXDheGwNeZU0CQf/u63m/eqVUVgFbCsT+Ra7LpDpSzXKrCcv04gg0KYo
         TmpbLrGW18FUYfkIoghWtc16bDjgmhBzvDYf7oB+ameDGjh4nCIKZiR2WFpti4J0LO4l
         Brrw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6jtOM8mZZKmsZo4C9gFxNiac994MaE+dUo5ZJ09ezrzLSVUcxnfpFDnl+rqPn/eNoShkpluuF+i8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzskLWLWqeCkTgnxpeE0GEBOGIYMYvD1XlLcDye/GpHgA0VR/O0
	/hA0YvAn7RhyuxIe1wjXvInLnHWSmYorJsGhPg3o6nTjHNKA7+u+/iWngcDOtxFuwSbtZd42Hw+
	/hk9YdnmFofeLTELEBuAFCApOWOn3HaTYohN/z8PMXYSyT2rqCI65RXkGV0wxndo=
X-Gm-Gg: AR+sD13X0Stjr/ihh07ENopxCcTlQCSXKemrrfRspIaRtpc4icKkiHx0hn4/+6fZBE2
	GXON2BiS3eENnAqs2p+03NfkMu0M6pI4fj+zbKb1t++KgyTSYEzQKP+XtBulv7QILp6mU2OijLF
	6lnEfK6EPbJErdOt0QOKw5GMtss5RCjSywurlnYGgjalIY2HPBi9gv1oKTpFwJNfhTLoS/9MzkS
	7OToWtVUWvX5VIoluh4MwSJmJtzTWrPL6KfriKBp15qToAsFZxM+IYh5x4s1G9L/w+ci5zCmGKq
	MwwlUCoclxhSwBuZsFmi7LI4+CX18AFB4jGTo8OPNWi1nXIPHjWhEoBxzXbu3BQ4n4Ps31Lycle
	wHZItWv1F8d1TsVOTez9BCbe2WZcFZJRqjxy1Nx2OsepCWvD58DVZyF0rDQ==
X-Received: by 2002:a17:903:468c:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2cfde7aeebcmr54904625ad.14.1785097747346;
        Sun, 26 Jul 2026 13:29:07 -0700 (PDT)
X-Received: by 2002:a17:903:468c:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2cfde7aeebcmr54904495ad.14.1785097746931;
        Sun, 26 Jul 2026 13:29:06 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm23593559eec.26.2026.07.26.13.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 13:29:06 -0700 (PDT)
Message-ID: <ded836f0-d683-4469-bae8-d95bb3e3cb63@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 13:29:04 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 01/10] wifi: cfg80211: pre-assign cookie for
 remain_on_channel, mgmt_tx, probe_peer and tx_control_port
To: Johannes Berg <johannes@sipsolutions.net>,
        Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
 <20260726192541.2816743-2-arend.vanspriel@broadcom.com>
 <9b00d432905facbe0f86556eda6c2986df79888d.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9b00d432905facbe0f86556eda6c2986df79888d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwOCBTYWx0ZWRfXxy2q8wEu/bYl
 xWdXSYYkd45iPnfAU3T/SvecWyfCODiarQfmgw5c8y/HU2fh0TNb4/gonDmmtAv2KyZcY7I7sGZ
 XCB1I3XFBH0MWTPn3Rif2mEr7XChjuQ=
X-Proofpoint-GUID: 3i2jnze6vYGzjMX-XUnJAToGwEwYRWEs
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a666e14 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=J1VZmZ6RygcxJUh0NWkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3i2jnze6vYGzjMX-XUnJAToGwEwYRWEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwOCBTYWx0ZWRfX5nMDylvOQfPh
 LEaN/wpuoPlr6QSyxuxA+dFfSH7wpBHorFyhOmvO922I8iaUDALNcMQd3rHIdf0iJ8H0I0gMiKW
 gKJ7amP75x/0wGibViyc5wBrMo6Iomz5Hs6IKS0dcOPWcdEuC9Revk1O2u6r2JWrqUldQE9Fxt8
 InGgBLYb/wqQtkVoXluukkRO7FSGuoiLjRJAdmmwbY81HKpIiqL7a2efkMCIOmWiObO9LF++zKR
 QQpZGz3MDCj5qkS2SYqVb9MxtxxAzzgKkN+qTUp2qd/0j9QKt0b3n++ta6SQzRJ5UgH8xpKwmpR
 CKUmKSZ5+Gwhsr1BQpY9SXcZ0TQAItJ+IJJc19XJshKmlfdWm3OPpsP3xZiykQFKcizqtLAlFzH
 DbcKcv1/bshqTtUFJ74Gn7aZf860q2lNvU270V7oUEq+PUw2FCrAVL9/mrDs2ypy94CGoUvIZcw
 RXYdeH4GnAlwwK9SAaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260208

On 7/26/2026 12:37 PM, Johannes Berg wrote:
> On Sun, 2026-07-26 at 21:25 +0200, Arend van Spriel wrote:
>> Having a single place for cookie assignment and keeping that
>> responsibility in the cfg80211 subsystem is a logical choice as it
>> handles the userspace nl80211 API. add_nan_func already does this:
>> cfg80211 calls cfg80211_assign_cookie() before invoking the driver.
>> Apply the same pattern to remain_on_channel, mgmt_tx, probe_peer and
>> tx_control_port by pre-assigning the cookie in the nl80211 command
>> handlers before the rdev_* call. For tx_control_port the cookie is
>> only pre-assigned when the caller requests an ack (cookie pointer
>> non-NULL).
>>
>> Drivers may still overwrite the value for now; subsequent patches will
>> remove per-driver cookie generation. Update the cfg80211_ops kerneldoc
>> to note that the cookie is pre-assigned and drivers must not modify it.
>>
>> Assisted-by: Claude:claude-sonnet-4-6
> 
> Hah, I _knew_ it, just based on the text style, before even reading
> beyond the cover letter ... I'm starting to even be able to tell the
> companies apart (not models yet, i.e. you could've told me this was
> Opus). E.g. "Patch 1 is the enabling change: [...]", "Non-obvious
> aspects" or "This means the cookie field is threaded through" etc.
> 
> Fun. What weird times we live in.

Indeed. And yes, I tend to edit the LLM commit text since the tense is often
wrong and the vocabulary often isn't want I'd use.

> 
> But you forgot S-o-b.

also wrong branch tag: s/-next/wireless-next/

> 
> johannes

